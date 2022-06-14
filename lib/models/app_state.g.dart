// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final GlobalKey<NavigatorState> navigator;
  @override
  final bool isLoading;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates))._build();

  _$AppState._({required this.navigator, required this.isLoading}) : super._() {
    BuiltValueNullFieldError.checkNotNull(navigator, r'AppState', 'navigator');
    BuiltValueNullFieldError.checkNotNull(isLoading, r'AppState', 'isLoading');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        navigator == other.navigator &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, navigator.hashCode), isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('navigator', navigator)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  GlobalKey<NavigatorState>? _navigator;
  GlobalKey<NavigatorState>? get navigator => _$this._navigator;
  set navigator(GlobalKey<NavigatorState>? navigator) =>
      _$this._navigator = navigator;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _navigator = $v.navigator;
      _isLoading = $v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppState build() => _build();

  _$AppState _build() {
    final _$result = _$v ??
        new _$AppState._(
            navigator: BuiltValueNullFieldError.checkNotNull(
                navigator, r'AppState', 'navigator'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'AppState', 'isLoading'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
