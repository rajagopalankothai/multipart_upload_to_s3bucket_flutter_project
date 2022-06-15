library my_file;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'my_file.g.dart';

abstract class MyFile implements Built<MyFile, MyFileBuilder> {
  factory MyFile([MyFileBuilder Function(MyFileBuilder builder) updates]) =
      _$MyFile;

  MyFile._();

  int? get id;

  String? get filename;

  @BuiltValueField(wireName: 's3_url')
  String? get signedUrl;

  @BuiltValueField(wireName: 'content_type')
  String? get contentType;

  @BuiltValueField(wireName: 's3_key')
  String? get s3ObjectId;

  static Serializer<MyFile> get serializer => _$myFileSerializer;
}

abstract class BucketResponse
    implements Built<BucketResponse, BucketResponseBuilder> {
  factory BucketResponse(
      [BucketResponseBuilder Function(BucketResponseBuilder builder)
          updates]) = _$BucketResponse;

  BucketResponse._();

  String? get url;

  @BuiltValueField(wireName: 'url_fields')
  S3BucketResponse? get urlFields;

  static Serializer<BucketResponse> get serializer =>
      _$bucketResponseSerializer;
}

abstract class S3BucketResponse
    implements Built<S3BucketResponse, S3BucketResponseBuilder> {
  factory S3BucketResponse(
      [S3BucketResponseBuilder Function(S3BucketResponseBuilder builder)
          updates]) = _$S3BucketResponse;

  S3BucketResponse._();

  String? get key;

  @BuiltValueField(wireName: 'success_action_status')
  String? get successActionStatus;

  String? get policy;

  @BuiltValueField(wireName: 'x-amz-credential')
  String? get xAmzCredential;

  @BuiltValueField(wireName: 'x-amz-algorithm')
  String? get xAmzAlgorithm;

  @BuiltValueField(wireName: 'x-amz-date')
  String? get xAmzDate;

  @BuiltValueField(wireName: 'x-amz-signature')
  String? get xAmzSignature;

  static Serializer<S3BucketResponse> get serializer =>
      _$s3BucketResponseSerializer;
}
