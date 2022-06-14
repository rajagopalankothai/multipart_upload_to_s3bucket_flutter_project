import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_presigned_url/models/my_file.dart';

part 'api_success.g.dart';

abstract class ApiSuccess implements Built<ApiSuccess, ApiSuccessBuilder> {
  factory ApiSuccess(
          [ApiSuccessBuilder Function(ApiSuccessBuilder builder) updates]) =
      _$ApiSuccess;

  ApiSuccess._();

  int? get status;

  String? get message;

  String? get success;

  String? get url;

  @BuiltValueField(wireName: 'url_fields')
  S3BucketResponse? get urlFields;

  static Serializer<ApiSuccess> get serializer => _$apiSuccessSerializer;
}
