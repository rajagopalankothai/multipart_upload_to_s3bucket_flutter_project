import 'dart:io';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_presigned_url/models/my_file.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../actions/auth_action.dart';
import '../models/app_state.dart';

part 'auth_connector.g.dart';

typedef UploadAttachmentToBucketAction = void Function(
    String? fileName, File? imageFile, ValueChanged<String>? attachment);
typedef UploadAttachmentToServerAction = void Function(List<String>? uploadedID,
    List<String>? fileName, ValueChanged<BuiltList<MyFile>>? attachment);

abstract class AuthViewModel
    implements Built<AuthViewModel, AuthViewModelBuilder> {
  factory AuthViewModel(
      [AuthViewModelBuilder Function(AuthViewModelBuilder builder)
          updates]) = _$AuthViewModel;

  AuthViewModel._();

  factory AuthViewModel.fromStore(Store<AppState> store) {
    return AuthViewModel((AuthViewModelBuilder b) {
      return b
        ..isLoading = store.state.isLoading
        ..uploadAttachmentToBucket = (String? fileName, File? imageFile,
            ValueChanged<String>? attachment) {
          store.dispatch(UploadAttachmentToBucket(
              fileName: fileName,
              imageFile: imageFile,
              attachment: attachment));
        }
        ..uploadAttachmentToServer = (
          List<String>? uploadedID,
          List<String>? fileName,
          ValueChanged<BuiltList<MyFile>>? attachment,
        ) {
          store.dispatch(UploadAttachmentToServer(
              uploadedID: uploadedID,
              attachment: attachment,
              fileName: fileName));
        };
    });
  }

  bool get isLoading;

  UploadAttachmentToBucketAction get uploadAttachmentToBucket;

  UploadAttachmentToServerAction get uploadAttachmentToServer;
}

class AuthConnector extends StatelessWidget {
  const AuthConnector({Key? key, required this.builder});

  final ViewModelBuilder<AuthViewModel> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
      builder: builder,
      converter: (Store<AppState> store) => AuthViewModel.fromStore(store),
    );
  }
}
