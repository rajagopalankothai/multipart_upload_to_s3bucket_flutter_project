// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApiSuccess> _$apiSuccessSerializer = new _$ApiSuccessSerializer();

class _$ApiSuccessSerializer implements StructuredSerializer<ApiSuccess> {
  @override
  final Iterable<Type> types = const [ApiSuccess, _$ApiSuccess];
  @override
  final String wireName = 'ApiSuccess';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.success;
    if (value != null) {
      result
        ..add('success')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.urlFields;
    if (value != null) {
      result
        ..add('url_fields')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(S3BucketResponse)));
    }
    return result;
  }

  @override
  ApiSuccess deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url_fields':
          result.urlFields.replace(serializers.deserialize(value,
                  specifiedType: const FullType(S3BucketResponse))!
              as S3BucketResponse);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiSuccess extends ApiSuccess {
  @override
  final int? status;
  @override
  final String? message;
  @override
  final String? success;
  @override
  final String? url;
  @override
  final S3BucketResponse? urlFields;

  factory _$ApiSuccess([void Function(ApiSuccessBuilder)? updates]) =>
      (new ApiSuccessBuilder()..update(updates))._build();

  _$ApiSuccess._(
      {this.status, this.message, this.success, this.url, this.urlFields})
      : super._();

  @override
  ApiSuccess rebuild(void Function(ApiSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiSuccessBuilder toBuilder() => new ApiSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiSuccess &&
        status == other.status &&
        message == other.message &&
        success == other.success &&
        url == other.url &&
        urlFields == other.urlFields;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, status.hashCode), message.hashCode),
                success.hashCode),
            url.hashCode),
        urlFields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiSuccess')
          ..add('status', status)
          ..add('message', message)
          ..add('success', success)
          ..add('url', url)
          ..add('urlFields', urlFields))
        .toString();
  }
}

class ApiSuccessBuilder implements Builder<ApiSuccess, ApiSuccessBuilder> {
  _$ApiSuccess? _$v;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _success;
  String? get success => _$this._success;
  set success(String? success) => _$this._success = success;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  S3BucketResponseBuilder? _urlFields;
  S3BucketResponseBuilder get urlFields =>
      _$this._urlFields ??= new S3BucketResponseBuilder();
  set urlFields(S3BucketResponseBuilder? urlFields) =>
      _$this._urlFields = urlFields;

  ApiSuccessBuilder();

  ApiSuccessBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _success = $v.success;
      _url = $v.url;
      _urlFields = $v.urlFields?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiSuccess other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiSuccess;
  }

  @override
  void update(void Function(ApiSuccessBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiSuccess build() => _build();

  _$ApiSuccess _build() {
    _$ApiSuccess _$result;
    try {
      _$result = _$v ??
          new _$ApiSuccess._(
              status: status,
              message: message,
              success: success,
              url: url,
              urlFields: _urlFields?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'urlFields';
        _urlFields?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
