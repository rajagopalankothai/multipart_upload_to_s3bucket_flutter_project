import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_presigned_url/models/my_file.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../actions/auth_action.dart';
import '../models/app_state.dart';

part 'auth_connector.g.dart';

typedef UploadAttachmentToServerAction = void Function(
  List<String>? uploadedID,
  List<String>? fileName,
  ValueChanged<BuiltList<MyFile>>? attachment,
);

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
        ..uploadAttachmentToServerAction = (
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

  UploadAttachmentToServerAction get uploadAttachmentToServerAction;
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
