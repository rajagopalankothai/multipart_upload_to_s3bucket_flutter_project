// GENERATED CODE - DO NOT MODIFY BY HAND

part of my_file;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MyFile> _$myFileSerializer = new _$MyFileSerializer();
Serializer<BucketResponse> _$bucketResponseSerializer =
    new _$BucketResponseSerializer();
Serializer<S3BucketResponse> _$s3BucketResponseSerializer =
    new _$S3BucketResponseSerializer();

class _$MyFileSerializer implements StructuredSerializer<MyFile> {
  @override
  final Iterable<Type> types = const [MyFile, _$MyFile];
  @override
  final String wireName = 'MyFile';

  @override
  Iterable<Object?> serialize(Serializers serializers, MyFile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.filename;
    if (value != null) {
      result
        ..add('filename')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.signedUrl;
    if (value != null) {
      result
        ..add('s3_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contentType;
    if (value != null) {
      result
        ..add('content_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.s3ObjectId;
    if (value != null) {
      result
        ..add('s3_key')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.publicUrl;
    if (value != null) {
      result
        ..add('public_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isVisibleDrive;
    if (value != null) {
      result
        ..add('is_visible_drive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  MyFile deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MyFileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'filename':
          result.filename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 's3_url':
          result.signedUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content_type':
          result.contentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 's3_key':
          result.s3ObjectId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'public_url':
          result.publicUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_visible_drive':
          result.isVisibleDrive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$BucketResponseSerializer
    implements StructuredSerializer<BucketResponse> {
  @override
  final Iterable<Type> types = const [BucketResponse, _$BucketResponse];
  @override
  final String wireName = 'BucketResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, BucketResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
  BucketResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BucketResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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

class _$S3BucketResponseSerializer
    implements StructuredSerializer<S3BucketResponse> {
  @override
  final Iterable<Type> types = const [S3BucketResponse, _$S3BucketResponse];
  @override
  final String wireName = 'S3BucketResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, S3BucketResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.key;
    if (value != null) {
      result
        ..add('key')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.successActionStatus;
    if (value != null) {
      result
        ..add('success_action_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.policy;
    if (value != null) {
      result
        ..add('policy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.xAmzCredential;
    if (value != null) {
      result
        ..add('x-amz-credential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.xAmzAlgorithm;
    if (value != null) {
      result
        ..add('x-amz-algorithm')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.xAmzDate;
    if (value != null) {
      result
        ..add('x-amz-date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.xAmzSignature;
    if (value != null) {
      result
        ..add('x-amz-signature')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  S3BucketResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new S3BucketResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'success_action_status':
          result.successActionStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'policy':
          result.policy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'x-amz-credential':
          result.xAmzCredential = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'x-amz-algorithm':
          result.xAmzAlgorithm = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'x-amz-date':
          result.xAmzDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'x-amz-signature':
          result.xAmzSignature = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$MyFile extends MyFile {
  @override
  final int? id;
  @override
  final String? filename;
  @override
  final String? signedUrl;
  @override
  final String? contentType;
  @override
  final String? s3ObjectId;
  @override
  final String? publicUrl;
  @override
  final bool? isVisibleDrive;

  factory _$MyFile([void Function(MyFileBuilder)? updates]) =>
      (new MyFileBuilder()..update(updates))._build();

  _$MyFile._(
      {this.id,
      this.filename,
      this.signedUrl,
      this.contentType,
      this.s3ObjectId,
      this.publicUrl,
      this.isVisibleDrive})
      : super._();

  @override
  MyFile rebuild(void Function(MyFileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyFileBuilder toBuilder() => new MyFileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyFile &&
        id == other.id &&
        filename == other.filename &&
        signedUrl == other.signedUrl &&
        contentType == other.contentType &&
        s3ObjectId == other.s3ObjectId &&
        publicUrl == other.publicUrl &&
        isVisibleDrive == other.isVisibleDrive;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), filename.hashCode),
                        signedUrl.hashCode),
                    contentType.hashCode),
                s3ObjectId.hashCode),
            publicUrl.hashCode),
        isVisibleDrive.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyFile')
          ..add('id', id)
          ..add('filename', filename)
          ..add('signedUrl', signedUrl)
          ..add('contentType', contentType)
          ..add('s3ObjectId', s3ObjectId)
          ..add('publicUrl', publicUrl)
          ..add('isVisibleDrive', isVisibleDrive))
        .toString();
  }
}

class MyFileBuilder implements Builder<MyFile, MyFileBuilder> {
  _$MyFile? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _filename;
  String? get filename => _$this._filename;
  set filename(String? filename) => _$this._filename = filename;

  String? _signedUrl;
  String? get signedUrl => _$this._signedUrl;
  set signedUrl(String? signedUrl) => _$this._signedUrl = signedUrl;

  String? _contentType;
  String? get contentType => _$this._contentType;
  set contentType(String? contentType) => _$this._contentType = contentType;

  String? _s3ObjectId;
  String? get s3ObjectId => _$this._s3ObjectId;
  set s3ObjectId(String? s3ObjectId) => _$this._s3ObjectId = s3ObjectId;

  String? _publicUrl;
  String? get publicUrl => _$this._publicUrl;
  set publicUrl(String? publicUrl) => _$this._publicUrl = publicUrl;

  bool? _isVisibleDrive;
  bool? get isVisibleDrive => _$this._isVisibleDrive;
  set isVisibleDrive(bool? isVisibleDrive) =>
      _$this._isVisibleDrive = isVisibleDrive;

  MyFileBuilder();

  MyFileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _filename = $v.filename;
      _signedUrl = $v.signedUrl;
      _contentType = $v.contentType;
      _s3ObjectId = $v.s3ObjectId;
      _publicUrl = $v.publicUrl;
      _isVisibleDrive = $v.isVisibleDrive;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyFile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyFile;
  }

  @override
  void update(void Function(MyFileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyFile build() => _build();

  _$MyFile _build() {
    final _$result = _$v ??
        new _$MyFile._(
            id: id,
            filename: filename,
            signedUrl: signedUrl,
            contentType: contentType,
            s3ObjectId: s3ObjectId,
            publicUrl: publicUrl,
            isVisibleDrive: isVisibleDrive);
    replace(_$result);
    return _$result;
  }
}

class _$BucketResponse extends BucketResponse {
  @override
  final String? url;
  @override
  final S3BucketResponse? urlFields;

  factory _$BucketResponse([void Function(BucketResponseBuilder)? updates]) =>
      (new BucketResponseBuilder()..update(updates))._build();

  _$BucketResponse._({this.url, this.urlFields}) : super._();

  @override
  BucketResponse rebuild(void Function(BucketResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BucketResponseBuilder toBuilder() =>
      new BucketResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BucketResponse &&
        url == other.url &&
        urlFields == other.urlFields;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, url.hashCode), urlFields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BucketResponse')
          ..add('url', url)
          ..add('urlFields', urlFields))
        .toString();
  }
}

class BucketResponseBuilder
    implements Builder<BucketResponse, BucketResponseBuilder> {
  _$BucketResponse? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  S3BucketResponseBuilder? _urlFields;
  S3BucketResponseBuilder get urlFields =>
      _$this._urlFields ??= new S3BucketResponseBuilder();
  set urlFields(S3BucketResponseBuilder? urlFields) =>
      _$this._urlFields = urlFields;

  BucketResponseBuilder();

  BucketResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _urlFields = $v.urlFields?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BucketResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BucketResponse;
  }

  @override
  void update(void Function(BucketResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BucketResponse build() => _build();

  _$BucketResponse _build() {
    _$BucketResponse _$result;
    try {
      _$result = _$v ??
          new _$BucketResponse._(url: url, urlFields: _urlFields?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'urlFields';
        _urlFields?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BucketResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$S3BucketResponse extends S3BucketResponse {
  @override
  final String? key;
  @override
  final String? successActionStatus;
  @override
  final String? policy;
  @override
  final String? xAmzCredential;
  @override
  final String? xAmzAlgorithm;
  @override
  final String? xAmzDate;
  @override
  final String? xAmzSignature;

  factory _$S3BucketResponse(
          [void Function(S3BucketResponseBuilder)? updates]) =>
      (new S3BucketResponseBuilder()..update(updates))._build();

  _$S3BucketResponse._(
      {this.key,
      this.successActionStatus,
      this.policy,
      this.xAmzCredential,
      this.xAmzAlgorithm,
      this.xAmzDate,
      this.xAmzSignature})
      : super._();

  @override
  S3BucketResponse rebuild(void Function(S3BucketResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  S3BucketResponseBuilder toBuilder() =>
      new S3BucketResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is S3BucketResponse &&
        key == other.key &&
        successActionStatus == other.successActionStatus &&
        policy == other.policy &&
        xAmzCredential == other.xAmzCredential &&
        xAmzAlgorithm == other.xAmzAlgorithm &&
        xAmzDate == other.xAmzDate &&
        xAmzSignature == other.xAmzSignature;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, key.hashCode), successActionStatus.hashCode),
                        policy.hashCode),
                    xAmzCredential.hashCode),
                xAmzAlgorithm.hashCode),
            xAmzDate.hashCode),
        xAmzSignature.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'S3BucketResponse')
          ..add('key', key)
          ..add('successActionStatus', successActionStatus)
          ..add('policy', policy)
          ..add('xAmzCredential', xAmzCredential)
          ..add('xAmzAlgorithm', xAmzAlgorithm)
          ..add('xAmzDate', xAmzDate)
          ..add('xAmzSignature', xAmzSignature))
        .toString();
  }
}

class S3BucketResponseBuilder
    implements Builder<S3BucketResponse, S3BucketResponseBuilder> {
  _$S3BucketResponse? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _successActionStatus;
  String? get successActionStatus => _$this._successActionStatus;
  set successActionStatus(String? successActionStatus) =>
      _$this._successActionStatus = successActionStatus;

  String? _policy;
  String? get policy => _$this._policy;
  set policy(String? policy) => _$this._policy = policy;

  String? _xAmzCredential;
  String? get xAmzCredential => _$this._xAmzCredential;
  set xAmzCredential(String? xAmzCredential) =>
      _$this._xAmzCredential = xAmzCredential;

  String? _xAmzAlgorithm;
  String? get xAmzAlgorithm => _$this._xAmzAlgorithm;
  set xAmzAlgorithm(String? xAmzAlgorithm) =>
      _$this._xAmzAlgorithm = xAmzAlgorithm;

  String? _xAmzDate;
  String? get xAmzDate => _$this._xAmzDate;
  set xAmzDate(String? xAmzDate) => _$this._xAmzDate = xAmzDate;

  String? _xAmzSignature;
  String? get xAmzSignature => _$this._xAmzSignature;
  set xAmzSignature(String? xAmzSignature) =>
      _$this._xAmzSignature = xAmzSignature;

  S3BucketResponseBuilder();

  S3BucketResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _successActionStatus = $v.successActionStatus;
      _policy = $v.policy;
      _xAmzCredential = $v.xAmzCredential;
      _xAmzAlgorithm = $v.xAmzAlgorithm;
      _xAmzDate = $v.xAmzDate;
      _xAmzSignature = $v.xAmzSignature;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(S3BucketResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$S3BucketResponse;
  }

  @override
  void update(void Function(S3BucketResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  S3BucketResponse build() => _build();

  _$S3BucketResponse _build() {
    final _$result = _$v ??
        new _$S3BucketResponse._(
            key: key,
            successActionStatus: successActionStatus,
            policy: policy,
            xAmzCredential: xAmzCredential,
            xAmzAlgorithm: xAmzAlgorithm,
            xAmzDate: xAmzDate,
            xAmzSignature: xAmzSignature);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
