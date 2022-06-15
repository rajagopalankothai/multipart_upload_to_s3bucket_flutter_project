import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_presigned_url/data/api/api_client.dart';
import 'package:flutter_presigned_url/data/services/api_service.dart';
import 'package:flutter_presigned_url/models/models.dart';
import 'package:flutter_presigned_url/models/my_file.dart';

class AuthService extends ApiService {
  AuthService({required ApiClient client}) : super(client: client);

//******************** upload-attachment-to-bucket ****************************//
  Future<Map<String, dynamic>?> uploadAttachmentToBucket(
      {Map<String, String>? headersToApi,
      Map<String, dynamic>? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.POST,
      headers: headersToApi,
      body: objToApi,
      path: '/content_management/contents/presigned_url',
    );
    if (res.isSuccess) {
      return {'url': res.data!.url, 'url_fields': res.data!.urlFields};
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }

//********************* upload-attachment-to-server ***************************//
  Future<BuiltList<MyFile>?> uploadAttachmentToServer(
      {Map<String, String>? headersToApi,
      Map<String, dynamic>? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.POST,
      headers: headersToApi,
      body: objToApi,
      path: '/content_management/contents',
    );
    if (res.isSuccess) {
      return res.data!.uploadedFile;
    } else if (res.isUnAuthorizedRequest) {
      throw true;
    } else {
      throw res.error;
    }
  }
}
