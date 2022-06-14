import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presigned_url/actions/auth_action.dart';
import 'package:flutter_presigned_url/data/api/api_client.dart';
import 'package:flutter_presigned_url/data/app_repository.dart';
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
      TypedMiddleware<AppState, UploadAttachmentToServer>(
          uploadAttachmentToServer)
    ];
  }

//************************ upload-attachment-to-server ************************//
  void uploadAttachmentToServer(Store<AppState> store,
      UploadAttachmentToServer action, NextDispatcher next) async {
    try {
      store.dispatch(SetLoader(true));
      final String? token = await repository.getUserAccessToken();
      final Map<String, String> headersToApi = await Utils.getHeader(token!);
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
