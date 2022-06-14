// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_connector.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthViewModel extends AuthViewModel {
  @override
  final bool isLoading;
  @override
  final UploadAttachmentToServerAction uploadAttachmentToServerAction;

  factory _$AuthViewModel([void Function(AuthViewModelBuilder)? updates]) =>
      (new AuthViewModelBuilder()..update(updates))._build();

  _$AuthViewModel._(
      {required this.isLoading, required this.uploadAttachmentToServerAction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'AuthViewModel', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(uploadAttachmentToServerAction,
        r'AuthViewModel', 'uploadAttachmentToServerAction');
  }

  @override
  AuthViewModel rebuild(void Function(AuthViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthViewModelBuilder toBuilder() => new AuthViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is AuthViewModel &&
        isLoading == other.isLoading &&
        uploadAttachmentToServerAction ==
            _$dynamicOther.uploadAttachmentToServerAction;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(0, isLoading.hashCode), uploadAttachmentToServerAction.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthViewModel')
          ..add('isLoading', isLoading)
          ..add(
              'uploadAttachmentToServerAction', uploadAttachmentToServerAction))
        .toString();
  }
}

class AuthViewModelBuilder
    implements Builder<AuthViewModel, AuthViewModelBuilder> {
  _$AuthViewModel? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  UploadAttachmentToServerAction? _uploadAttachmentToServerAction;
  UploadAttachmentToServerAction? get uploadAttachmentToServerAction =>
      _$this._uploadAttachmentToServerAction;
  set uploadAttachmentToServerAction(
          UploadAttachmentToServerAction? uploadAttachmentToServerAction) =>
      _$this._uploadAttachmentToServerAction = uploadAttachmentToServerAction;

  AuthViewModelBuilder();

  AuthViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _uploadAttachmentToServerAction = $v.uploadAttachmentToServerAction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthViewModel;
  }

  @override
  void update(void Function(AuthViewModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthViewModel build() => _build();

  _$AuthViewModel _build() {
    final _$result = _$v ??
        new _$AuthViewModel._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'AuthViewModel', 'isLoading'),
            uploadAttachmentToServerAction:
                BuiltValueNullFieldError.checkNotNull(
                    uploadAttachmentToServerAction,
                    r'AuthViewModel',
                    'uploadAttachmentToServerAction'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
