import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_presigned_url/models/models.dart';
import 'package:flutter_presigned_url/models/my_file.dart';



part 'serializers.g.dart';

@SerializersFor(<Type>[
  ApiError,
  ApiSuccess,
  MyFile,

])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
