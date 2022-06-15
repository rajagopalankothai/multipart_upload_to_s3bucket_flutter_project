import 'package:flutter_presigned_url/models/models.dart';
import 'package:flutter_presigned_url/reducer/auth_reducer.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[authReducer]);
