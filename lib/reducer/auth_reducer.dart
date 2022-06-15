import 'package:flutter_presigned_url/actions/auth_action.dart';
import 'package:flutter_presigned_url/models/models.dart';
import 'package:redux/redux.dart';

Reducer<AppState> authReducer = combineReducers(
    <Reducer<AppState>>[TypedReducer<AppState, SetLoader>(setLoader)]);

AppState setLoader(AppState state, SetLoader action) {
  final AppStateBuilder b = state.toBuilder();
  b.isLoading = action.isLoading;
  return b.build();
}
