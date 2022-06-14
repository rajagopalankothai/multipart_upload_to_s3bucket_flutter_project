import 'dart:async';
import 'dart:convert';
import 'package:flutter_presigned_url/models/models.dart';
import 'package:http/http.dart';
import 'package:flutter_presigned_url/core/utils/utils.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as io_client;

enum Method {
  GET,
  POST,
  PUT,
  DELETE,
  PATCH,
}

class ApiConfig {
  const ApiConfig({
    required this.scheme,
    required this.host,
    this.port,
    this.scope,
  }) : assert(scheme != null && host != null,
            'Scheme, host and port cannot be null');

  final String scheme;
  final String host;
  final int? port;
  final String? scope;

  @override
  String toString() {
    if (port == null) {
      return '$scheme://$host${scope ?? ''}';
    }
    return '$scheme://$host:$port${scope ?? ''}';
  }
}

class ApiResponse<T> extends http.Response {
  ApiResponse.from(http.Response response, this.responseKey, {this.fullType})
      : super(
          response.body,
          response.statusCode,
          headers: response.headers,
          isRedirect: response.isRedirect,
          persistentConnection: response.persistentConnection,
          reasonPhrase: response.reasonPhrase,
          request: response.request,
        ) {
    _data = _getData();
    _error = _getError();
//    _pagination = _getPagination();
  }

  final String? responseKey;

  final FullType? fullType;

  T? get data => _data;

  T? _data;

  T? _getData() {
    if (!isSuccess || body == null || body.isEmpty) {
      return null;
    }

    dynamic decodedBody = json.decode(body);
    if (responseKey != null) {
      decodedBody = decodedBody[responseKey];
    }

    return serializers.deserialize(
      decodedBody,
      specifiedType: fullType ?? FullType(T),
    ) as T;
  }

  // end

//   pagination block
//  bool get hasPagination => _pagination != null;
//
//  Pagination get pagination => _pagination;
//
//  Pagination _pagination;
//
//  Pagination _getPagination() {
//    if (!isSuccess || body == null) {
//      return null;
//    }
//
//    final dynamic decodedBody = json.decode(body);
//
//    if (decodedBody == null) {
//      return null;
//    }
//
//    if(decodedBody['pagination'] == null){
//      return null;
//    }
//
//    return serializers.deserialize(
//      decodedBody,
//      specifiedType: const FullType(Pagination),
//    );
//  }

  // end

  // error block
  ApiError? _error;

  ApiError get error => _error!;

  ApiError? _getError() {
    if (isSuccess) {
      return null;
    }

    try {
      dynamic decodedBody = json.decode(body);

      return serializers.deserialize(
        decodedBody,
        specifiedType: const FullType(ApiError),
      ) as ApiError;
    } on FormatException {
      return ApiError((ApiErrorBuilder b) {
        return b
          ..status = 0
          ..error = 'Something went wrong'
          ..message = ListBuilder<String>(<String>['Something went wrong']);
      });
    }
  }

  // end

  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  bool get isUnAuthorizedRequest => statusCode == 401;
}

class ApiClient extends io_client.IOClient {
  ApiClient({required this.config})
      : assert(config != null, 'Config cannot be null') {
    log.d(config.toString());
  }

  final Logger log = Logger(tag: 'ApiClient');

  final ApiConfig config;
  Map<String, String>? authHeaders;

  Map<String, String> get defaultHeaders =>
      <String, String>{'Content-Type': 'application/json'};

  Uri buildUrl({String? path, Map<String, dynamic>? queryParams}) {
    final Uri uri = Uri(
      scheme: config.scheme,
      host: config.host,
      port: config.port,
      queryParameters: queryParams,
      path: '${config.scope ?? ''}$path',
    );

    return uri;
  }

  Future<ApiResponse<R>> callJsonApi<R>({
    required Method method,
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    dynamic body,
    MultipartRequest? formDataRequest,
    Encoding? encoding,
    //Request data is wrapped in this key before making any request
    String? requestKey,
    //Deserializer uses this key to extract deserializable object from response
    String? responseKey,
    FullType? fullType,
  }) async {
    final Uri url = buildUrl(path: path, queryParams: queryParams);

    http.Response response;

    dynamic requestBody = body;

    if (requestKey != null) {
      requestBody = <String, dynamic>{'$requestKey': requestBody};
    }
    final String? encodedBody =
        requestBody != null ? json.encode(requestBody) : null;

    final Map<String, String> allHeaders = <String, String>{}
      ..addAll(defaultHeaders)
      ..addAll(authHeaders ?? <String, String>{})
      ..addAll(headers ?? <String, String>{});

    if (formDataRequest != null) {
      final Uri uri = Uri.parse(url.toString());
      final MultipartRequest request =
           MultipartRequest(formDataRequest.method, uri);
      request.headers.addAll(headers!);
      request.fields.addAll(formDataRequest.fields);
      request.files.addAll(formDataRequest.files);
      response = await Response.fromStream(await request.send());
    } else {
      switch (method) {
        case Method.GET:
          response = await get(
            url,
            headers: allHeaders,
          );
          break;
        case Method.POST:
          response = await post(
            url,
            headers: allHeaders,
            body: encodedBody,
            encoding: encoding,
          );
          break;
        case Method.PUT:
          response = await put(
            url,
            headers: allHeaders,
            body: encodedBody,
            encoding: encoding,
          );
          break;
        case Method.PATCH:
          response = await patch(
            url,
            headers: allHeaders,
            body: encodedBody,
            encoding: encoding,
          );
          break;
        case Method.DELETE:
          response = await delete(
            url,
            headers: allHeaders,
          );
          break;
        default:
          throw 'Method $method does not exist';
      }
    }

    log.d('''

    ____________________________________
   URL: ${response.request!.url}
    Request-method: ${method.toString()}
    HEADERS: ${response.request!.headers}
    REQUEST-BODY : ${requestBody?.toString()}
    RESPONSE : ${response.body}
    STATUS-CODE : ${response.statusCode}
    ____________________________________
    ''');

    return ApiResponse<R>.from(response, responseKey, fullType: fullType);
  }
}
