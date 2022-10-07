// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserPostsRecord> _$userPostsRecordSerializer =
    new _$UserPostsRecordSerializer();

class _$UserPostsRecordSerializer
    implements StructuredSerializer<UserPostsRecord> {
  @override
  final Iterable<Type> types = const [UserPostsRecord, _$UserPostsRecord];
  @override
  final String wireName = 'UserPostsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserPostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.postImage;
    if (value != null) {
      result
        ..add('post_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postTitle;
    if (value != null) {
      result
        ..add('post_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postTime;
    if (value != null) {
      result
        ..add('post_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.postVideo;
    if (value != null) {
      result
        ..add('post_video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userImg;
    if (value != null) {
      result
        ..add('user_img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.postUserName;
    if (value != null) {
      result
        ..add('post_user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.likedBy;
    if (value != null) {
      result
        ..add('likedBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.commnetTime;
    if (value != null) {
      result
        ..add('commnet_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.commentBy;
    if (value != null) {
      result
        ..add('commentBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isFavourite;
    if (value != null) {
      result
        ..add('is_favourite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  UserPostsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserPostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'post_image':
          result.postImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_title':
          result.postTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_time':
          result.postTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'post_video':
          result.postVideo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_img':
          result.userImg = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'post_user_name':
          result.postUserName = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'likedBy':
          result.likedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'commnet_time':
          result.commnetTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'commentBy':
          result.commentBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'is_favourite':
          result.isFavourite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$UserPostsRecord extends UserPostsRecord {
  @override
  final String? postImage;
  @override
  final String? postTitle;
  @override
  final DateTime? postTime;
  @override
  final String? postVideo;
  @override
  final DocumentReference<Object?>? userImg;
  @override
  final DocumentReference<Object?>? postUserName;
  @override
  final BuiltList<DocumentReference<Object?>>? likedBy;
  @override
  final DateTime? commnetTime;
  @override
  final BuiltList<DocumentReference<Object?>>? commentBy;
  @override
  final BuiltList<String>? comments;
  @override
  final bool? isFavourite;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserPostsRecord([void Function(UserPostsRecordBuilder)? updates]) =>
      (new UserPostsRecordBuilder()..update(updates))._build();

  _$UserPostsRecord._(
      {this.postImage,
      this.postTitle,
      this.postTime,
      this.postVideo,
      this.userImg,
      this.postUserName,
      this.likedBy,
      this.commnetTime,
      this.commentBy,
      this.comments,
      this.isFavourite,
      this.ffRef})
      : super._();

  @override
  UserPostsRecord rebuild(void Function(UserPostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPostsRecordBuilder toBuilder() =>
      new UserPostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPostsRecord &&
        postImage == other.postImage &&
        postTitle == other.postTitle &&
        postTime == other.postTime &&
        postVideo == other.postVideo &&
        userImg == other.userImg &&
        postUserName == other.postUserName &&
        likedBy == other.likedBy &&
        commnetTime == other.commnetTime &&
        commentBy == other.commentBy &&
        comments == other.comments &&
        isFavourite == other.isFavourite &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, postImage.hashCode),
                                                postTitle.hashCode),
                                            postTime.hashCode),
                                        postVideo.hashCode),
                                    userImg.hashCode),
                                postUserName.hashCode),
                            likedBy.hashCode),
                        commnetTime.hashCode),
                    commentBy.hashCode),
                comments.hashCode),
            isFavourite.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserPostsRecord')
          ..add('postImage', postImage)
          ..add('postTitle', postTitle)
          ..add('postTime', postTime)
          ..add('postVideo', postVideo)
          ..add('userImg', userImg)
          ..add('postUserName', postUserName)
          ..add('likedBy', likedBy)
          ..add('commnetTime', commnetTime)
          ..add('commentBy', commentBy)
          ..add('comments', comments)
          ..add('isFavourite', isFavourite)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserPostsRecordBuilder
    implements Builder<UserPostsRecord, UserPostsRecordBuilder> {
  _$UserPostsRecord? _$v;

  String? _postImage;
  String? get postImage => _$this._postImage;
  set postImage(String? postImage) => _$this._postImage = postImage;

  String? _postTitle;
  String? get postTitle => _$this._postTitle;
  set postTitle(String? postTitle) => _$this._postTitle = postTitle;

  DateTime? _postTime;
  DateTime? get postTime => _$this._postTime;
  set postTime(DateTime? postTime) => _$this._postTime = postTime;

  String? _postVideo;
  String? get postVideo => _$this._postVideo;
  set postVideo(String? postVideo) => _$this._postVideo = postVideo;

  DocumentReference<Object?>? _userImg;
  DocumentReference<Object?>? get userImg => _$this._userImg;
  set userImg(DocumentReference<Object?>? userImg) => _$this._userImg = userImg;

  DocumentReference<Object?>? _postUserName;
  DocumentReference<Object?>? get postUserName => _$this._postUserName;
  set postUserName(DocumentReference<Object?>? postUserName) =>
      _$this._postUserName = postUserName;

  ListBuilder<DocumentReference<Object?>>? _likedBy;
  ListBuilder<DocumentReference<Object?>> get likedBy =>
      _$this._likedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set likedBy(ListBuilder<DocumentReference<Object?>>? likedBy) =>
      _$this._likedBy = likedBy;

  DateTime? _commnetTime;
  DateTime? get commnetTime => _$this._commnetTime;
  set commnetTime(DateTime? commnetTime) => _$this._commnetTime = commnetTime;

  ListBuilder<DocumentReference<Object?>>? _commentBy;
  ListBuilder<DocumentReference<Object?>> get commentBy =>
      _$this._commentBy ??= new ListBuilder<DocumentReference<Object?>>();
  set commentBy(ListBuilder<DocumentReference<Object?>>? commentBy) =>
      _$this._commentBy = commentBy;

  ListBuilder<String>? _comments;
  ListBuilder<String> get comments =>
      _$this._comments ??= new ListBuilder<String>();
  set comments(ListBuilder<String>? comments) => _$this._comments = comments;

  bool? _isFavourite;
  bool? get isFavourite => _$this._isFavourite;
  set isFavourite(bool? isFavourite) => _$this._isFavourite = isFavourite;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserPostsRecordBuilder() {
    UserPostsRecord._initializeBuilder(this);
  }

  UserPostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postImage = $v.postImage;
      _postTitle = $v.postTitle;
      _postTime = $v.postTime;
      _postVideo = $v.postVideo;
      _userImg = $v.userImg;
      _postUserName = $v.postUserName;
      _likedBy = $v.likedBy?.toBuilder();
      _commnetTime = $v.commnetTime;
      _commentBy = $v.commentBy?.toBuilder();
      _comments = $v.comments?.toBuilder();
      _isFavourite = $v.isFavourite;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserPostsRecord;
  }

  @override
  void update(void Function(UserPostsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserPostsRecord build() => _build();

  _$UserPostsRecord _build() {
    _$UserPostsRecord _$result;
    try {
      _$result = _$v ??
          new _$UserPostsRecord._(
              postImage: postImage,
              postTitle: postTitle,
              postTime: postTime,
              postVideo: postVideo,
              userImg: userImg,
              postUserName: postUserName,
              likedBy: _likedBy?.build(),
              commnetTime: commnetTime,
              commentBy: _commentBy?.build(),
              comments: _comments?.build(),
              isFavourite: isFavourite,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likedBy';
        _likedBy?.build();

        _$failedField = 'commentBy';
        _commentBy?.build();
        _$failedField = 'comments';
        _comments?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserPostsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
