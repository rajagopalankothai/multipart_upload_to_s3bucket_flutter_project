import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_presigned_url/models/my_file.dart';

//**************************** manage loading status *************************//
class SetLoader {
  SetLoader(this.isLoading);

  final bool isLoading;
}

//************************ upload-attachment-to-server ************************//
class UploadAttachmentToServer {
  final List<String>? uploadedID;
  final List<String>? fileName;
  final ValueChanged<BuiltList<MyFile>>? attachment;

  UploadAttachmentToServer({
    this.attachment,
    required this.uploadedID,
    required this.fileName,
  });
}
