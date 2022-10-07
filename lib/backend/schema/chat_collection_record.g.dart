// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_collection_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatCollectionRecord> _$chatCollectionRecordSerializer =
    new _$ChatCollectionRecordSerializer();

class _$ChatCollectionRecordSerializer
    implements StructuredSerializer<ChatCollectionRecord> {
  @override
  final Iterable<Type> types = const [
    ChatCollectionRecord,
    _$ChatCollectionRecord
  ];
  @override
  final String wireName = 'ChatCollectionRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChatCollectionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.msgBox;
    if (value != null) {
      result
        ..add('msgBox')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.msgsentdatetime;
    if (value != null) {
      result
        ..add('msgsentdatetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.mediaurl;
    if (value != null) {
      result
        ..add('mediaurl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ChatCollectionRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatCollectionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'msgBox':
          result.msgBox = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'msgsentdatetime':
          result.msgsentdatetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'mediaurl':
          result.mediaurl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatCollectionRecord extends ChatCollectionRecord {
  @override
  final String? msgBox;
  @override
  final DocumentReference<Object?>? username;
  @override
  final DateTime? msgsentdatetime;
  @override
  final String? mediaurl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatCollectionRecord(
          [void Function(ChatCollectionRecordBuilder)? updates]) =>
      (new ChatCollectionRecordBuilder()..update(updates))._build();

  _$ChatCollectionRecord._(
      {this.msgBox,
      this.username,
      this.msgsentdatetime,
      this.mediaurl,
      this.ffRef})
      : super._();

  @override
  ChatCollectionRecord rebuild(
          void Function(ChatCollectionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatCollectionRecordBuilder toBuilder() =>
      new ChatCollectionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatCollectionRecord &&
        msgBox == other.msgBox &&
        username == other.username &&
        msgsentdatetime == other.msgsentdatetime &&
        mediaurl == other.mediaurl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, msgBox.hashCode), username.hashCode),
                msgsentdatetime.hashCode),
            mediaurl.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatCollectionRecord')
          ..add('msgBox', msgBox)
          ..add('username', username)
          ..add('msgsentdatetime', msgsentdatetime)
          ..add('mediaurl', mediaurl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatCollectionRecordBuilder
    implements Builder<ChatCollectionRecord, ChatCollectionRecordBuilder> {
  _$ChatCollectionRecord? _$v;

  String? _msgBox;
  String? get msgBox => _$this._msgBox;
  set msgBox(String? msgBox) => _$this._msgBox = msgBox;

  DocumentReference<Object?>? _username;
  DocumentReference<Object?>? get username => _$this._username;
  set username(DocumentReference<Object?>? username) =>
      _$this._username = username;

  DateTime? _msgsentdatetime;
  DateTime? get msgsentdatetime => _$this._msgsentdatetime;
  set msgsentdatetime(DateTime? msgsentdatetime) =>
      _$this._msgsentdatetime = msgsentdatetime;

  String? _mediaurl;
  String? get mediaurl => _$this._mediaurl;
  set mediaurl(String? mediaurl) => _$this._mediaurl = mediaurl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatCollectionRecordBuilder() {
    ChatCollectionRecord._initializeBuilder(this);
  }

  ChatCollectionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _msgBox = $v.msgBox;
      _username = $v.username;
      _msgsentdatetime = $v.msgsentdatetime;
      _mediaurl = $v.mediaurl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatCollectionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatCollectionRecord;
  }

  @override
  void update(void Function(ChatCollectionRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatCollectionRecord build() => _build();

  _$ChatCollectionRecord _build() {
    final _$result = _$v ??
        new _$ChatCollectionRecord._(
            msgBox: msgBox,
            username: username,
            msgsentdatetime: msgsentdatetime,
            mediaurl: mediaurl,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
