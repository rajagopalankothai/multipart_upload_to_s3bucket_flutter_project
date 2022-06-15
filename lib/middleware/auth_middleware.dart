import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presigned_url/actions/auth_action.dart';
import 'package:flutter_presigned_url/data/app_repository.dart';
import 'package:flutter_presigned_url/data/services/auth_service.dart';
import 'package:flutter_presigned_url/models/models.dart';
import 'package:flutter_presigned_url/models/my_file.dart';
import 'package:redux/redux.dart';

class AuthMiddleware {
  AuthMiddleware({required this.repository})
      : authService = repository.getService<AuthService>() as AuthService;

  final AppRepository repository;
  final AuthService authService;

  List<Middleware<AppState>> createAuthMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, UploadAttachmentToBucket>(
          uploadAttachmentToBucket),
      TypedMiddleware<AppState, UploadAttachmentToServer>(
          uploadAttachmentToServer)
    ];
  }

//**************** upload-attachment-to-bucket ********************************//
  void uploadAttachmentToBucket(Store<AppState> store,
      UploadAttachmentToBucket action, NextDispatcher next) async {
    try {
      store.dispatch(SetLoader(true));
      final Map<String, String> headersToApi = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer TokenHere',
      };
      final Map<String, dynamic> objToApi = <String, dynamic>{
        "filename": action.fileName
      };
      final Map<String, dynamic>? response =
          await authService.uploadAttachmentToBucket(
              headersToApi: headersToApi, objToApi: objToApi);
      final S3BucketResponse _s3BucketResponse = response!['url_fields'];
      Dio dio = Dio();
      var formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(action.imageFile!.path),
        "key": _s3BucketResponse.key,
        "success_action_status": _s3BucketResponse.successActionStatus,
        "policy": _s3BucketResponse.policy,
        "x-amz-credential": _s3BucketResponse.xAmzCredential,
        "x-amz-algorithm": _s3BucketResponse.xAmzAlgorithm,
        "x-amz-date": _s3BucketResponse.xAmzDate,
        "x-amz-signature": _s3BucketResponse.xAmzSignature
      });
      var s3BucketResponse = await dio.post(response['url'], data: formData);
      if (s3BucketResponse.statusCode == 201) {
        final document = s3BucketResponse.data.toString();
        action.attachment!(
            document.toString().split('<Key>').last.split('</Key>').first);
      }
      store.dispatch(SetLoader(false));
    } on ApiError catch (e) {
      store.dispatch(SetLoader(false));
      debugPrint('============ upload file block ========== ${e.toString()}');
      return;
    } catch (e) {
      store.dispatch(SetLoader(false));
      debugPrint(
          '============ upload file catch block ========== ${e.toString()}');
    }
    next(action);
  }

//************************ upload-attachment-to-server ************************//
  void uploadAttachmentToServer(Store<AppState> store,
      UploadAttachmentToServer action, NextDispatcher next) async {
    try {
      store.dispatch(SetLoader(true));
      final Map<String, String> headersToApi = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer TokenHere',
      };
      List<Map<String, dynamic>>? x = [];
      for (int i = 0; i < action.fileName!.length; i++) {
        x.add(
            {'s3_key': action.uploadedID![i], 'filename': action.fileName![i]});
      }
      Map<String, dynamic> objToApi = {"contents": x};
      final BuiltList<MyFile>? attachment =
          await authService.uploadAttachmentToServer(
              headersToApi: headersToApi, objToApi: objToApi);
      action.attachment!(attachment!);
      store.dispatch(SetLoader(false));
    } on ApiError catch (e) {
      store.dispatch(SetLoader(false));
      debugPrint(
          '============ upload-attachment-to-server block ========== ${e.toString()}');
      return;
    } catch (e) {
      store.dispatch(SetLoader(false));
      debugPrint(
          '============ upload-attachment-to-server catch block ========== ${e.toString()}');
    }
    next(action);
  }
}
