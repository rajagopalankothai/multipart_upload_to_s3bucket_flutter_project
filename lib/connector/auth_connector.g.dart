// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_connector.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthViewModel extends AuthViewModel {
  @override
  final bool isLoading;
  @override
  final UploadAttachmentToBucketAction uploadAttachmentToBucket;
  @override
  final UploadAttachmentToServerAction uploadAttachmentToServer;

  factory _$AuthViewModel([void Function(AuthViewModelBuilder)? updates]) =>
      (new AuthViewModelBuilder()..update(updates))._build();

  _$AuthViewModel._(
      {required this.isLoading,
      required this.uploadAttachmentToBucket,
      required this.uploadAttachmentToServer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'AuthViewModel', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        uploadAttachmentToBucket, r'AuthViewModel', 'uploadAttachmentToBucket');
    BuiltValueNullFieldError.checkNotNull(
        uploadAttachmentToServer, r'AuthViewModel', 'uploadAttachmentToServer');
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
        uploadAttachmentToBucket == _$dynamicOther.uploadAttachmentToBucket &&
        uploadAttachmentToServer == _$dynamicOther.uploadAttachmentToServer;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isLoading.hashCode), uploadAttachmentToBucket.hashCode),
        uploadAttachmentToServer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthViewModel')
          ..add('isLoading', isLoading)
          ..add('uploadAttachmentToBucket', uploadAttachmentToBucket)
          ..add('uploadAttachmentToServer', uploadAttachmentToServer))
        .toString();
  }
}

class AuthViewModelBuilder
    implements Builder<AuthViewModel, AuthViewModelBuilder> {
  _$AuthViewModel? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  UploadAttachmentToBucketAction? _uploadAttachmentToBucket;
  UploadAttachmentToBucketAction? get uploadAttachmentToBucket =>
      _$this._uploadAttachmentToBucket;
  set uploadAttachmentToBucket(
          UploadAttachmentToBucketAction? uploadAttachmentToBucket) =>
      _$this._uploadAttachmentToBucket = uploadAttachmentToBucket;

  UploadAttachmentToServerAction? _uploadAttachmentToServer;
  UploadAttachmentToServerAction? get uploadAttachmentToServer =>
      _$this._uploadAttachmentToServer;
  set uploadAttachmentToServer(
          UploadAttachmentToServerAction? uploadAttachmentToServer) =>
      _$this._uploadAttachmentToServer = uploadAttachmentToServer;

  AuthViewModelBuilder();

  AuthViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _uploadAttachmentToBucket = $v.uploadAttachmentToBucket;
      _uploadAttachmentToServer = $v.uploadAttachmentToServer;
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
            uploadAttachmentToBucket: BuiltValueNullFieldError.checkNotNull(
                uploadAttachmentToBucket,
                r'AuthViewModel',
                'uploadAttachmentToBucket'),
            uploadAttachmentToServer: BuiltValueNullFieldError.checkNotNull(
                uploadAttachmentToServer,
                r'AuthViewModel',
                'uploadAttachmentToServer'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
