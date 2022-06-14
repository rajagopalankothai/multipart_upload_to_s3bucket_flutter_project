import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState(
      [AppStateBuilder Function(AppStateBuilder builder) updates]) = _$AppState;

  AppState._();

  static AppState initState() {
    return AppState((AppStateBuilder b) {
      return b
        ..navigator = GlobalKey<NavigatorState>()
        ..isLoading = false;
    });
  }

  GlobalKey<NavigatorState> get navigator;

  bool get isLoading;
}
