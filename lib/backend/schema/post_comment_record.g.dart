// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostCommentRecord> _$postCommentRecordSerializer =
    new _$PostCommentRecordSerializer();

class _$PostCommentRecordSerializer
    implements StructuredSerializer<PostCommentRecord> {
  @override
  final Iterable<Type> types = const [PostCommentRecord, _$PostCommentRecord];
  @override
  final String wireName = 'PostCommentRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostCommentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commentedTime;
    if (value != null) {
      result
        ..add('commented_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.userImg;
    if (value != null) {
      result
        ..add('user_img')
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
  PostCommentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostCommentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'comments':
          result.comments = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commented_time':
          result.commentedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'user_name':
          result.userName.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'user_img':
          result.userImg = serializers.deserialize(value,
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

class _$PostCommentRecord extends PostCommentRecord {
  @override
  final String? comments;
  @override
  final DateTime? commentedTime;
  @override
  final BuiltList<DocumentReference<Object?>>? userName;
  @override
  final String? userImg;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PostCommentRecord(
          [void Function(PostCommentRecordBuilder)? updates]) =>
      (new PostCommentRecordBuilder()..update(updates))._build();

  _$PostCommentRecord._(
      {this.comments,
      this.commentedTime,
      this.userName,
      this.userImg,
      this.ffRef})
      : super._();

  @override
  PostCommentRecord rebuild(void Function(PostCommentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostCommentRecordBuilder toBuilder() =>
      new PostCommentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostCommentRecord &&
        comments == other.comments &&
        commentedTime == other.commentedTime &&
        userName == other.userName &&
        userImg == other.userImg &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, comments.hashCode), commentedTime.hashCode),
                userName.hashCode),
            userImg.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostCommentRecord')
          ..add('comments', comments)
          ..add('commentedTime', commentedTime)
          ..add('userName', userName)
          ..add('userImg', userImg)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PostCommentRecordBuilder
    implements Builder<PostCommentRecord, PostCommentRecordBuilder> {
  _$PostCommentRecord? _$v;

  String? _comments;
  String? get comments => _$this._comments;
  set comments(String? comments) => _$this._comments = comments;

  DateTime? _commentedTime;
  DateTime? get commentedTime => _$this._commentedTime;
  set commentedTime(DateTime? commentedTime) =>
      _$this._commentedTime = commentedTime;

  ListBuilder<DocumentReference<Object?>>? _userName;
  ListBuilder<DocumentReference<Object?>> get userName =>
      _$this._userName ??= new ListBuilder<DocumentReference<Object?>>();
  set userName(ListBuilder<DocumentReference<Object?>>? userName) =>
      _$this._userName = userName;

  String? _userImg;
  String? get userImg => _$this._userImg;
  set userImg(String? userImg) => _$this._userImg = userImg;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PostCommentRecordBuilder() {
    PostCommentRecord._initializeBuilder(this);
  }

  PostCommentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comments = $v.comments;
      _commentedTime = $v.commentedTime;
      _userName = $v.userName?.toBuilder();
      _userImg = $v.userImg;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostCommentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostCommentRecord;
  }

  @override
  void update(void Function(PostCommentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostCommentRecord build() => _build();

  _$PostCommentRecord _build() {
    _$PostCommentRecord _$result;
    try {
      _$result = _$v ??
          new _$PostCommentRecord._(
              comments: comments,
              commentedTime: commentedTime,
              userName: _userName?.build(),
              userImg: userImg,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userName';
        _userName?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostCommentRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
