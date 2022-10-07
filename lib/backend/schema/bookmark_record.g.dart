// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookmarkRecord> _$bookmarkRecordSerializer =
    new _$BookmarkRecordSerializer();

class _$BookmarkRecordSerializer
    implements StructuredSerializer<BookmarkRecord> {
  @override
  final Iterable<Type> types = const [BookmarkRecord, _$BookmarkRecord];
  @override
  final String wireName = 'BookmarkRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BookmarkRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.favouritePost;
    if (value != null) {
      result
        ..add('favourite_post')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  BookmarkRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookmarkRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'favourite_post':
          result.favouritePost = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$BookmarkRecord extends BookmarkRecord {
  @override
  final String? favouritePost;
  @override
  final DocumentReference<Object?>? userName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BookmarkRecord([void Function(BookmarkRecordBuilder)? updates]) =>
      (new BookmarkRecordBuilder()..update(updates))._build();

  _$BookmarkRecord._({this.favouritePost, this.userName, this.ffRef})
      : super._();

  @override
  BookmarkRecord rebuild(void Function(BookmarkRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookmarkRecordBuilder toBuilder() =>
      new BookmarkRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookmarkRecord &&
        favouritePost == other.favouritePost &&
        userName == other.userName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, favouritePost.hashCode), userName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookmarkRecord')
          ..add('favouritePost', favouritePost)
          ..add('userName', userName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BookmarkRecordBuilder
    implements Builder<BookmarkRecord, BookmarkRecordBuilder> {
  _$BookmarkRecord? _$v;

  String? _favouritePost;
  String? get favouritePost => _$this._favouritePost;
  set favouritePost(String? favouritePost) =>
      _$this._favouritePost = favouritePost;

  DocumentReference<Object?>? _userName;
  DocumentReference<Object?>? get userName => _$this._userName;
  set userName(DocumentReference<Object?>? userName) =>
      _$this._userName = userName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BookmarkRecordBuilder() {
    BookmarkRecord._initializeBuilder(this);
  }

  BookmarkRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _favouritePost = $v.favouritePost;
      _userName = $v.userName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookmarkRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookmarkRecord;
  }

  @override
  void update(void Function(BookmarkRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookmarkRecord build() => _build();

  _$BookmarkRecord _build() {
    final _$result = _$v ??
        new _$BookmarkRecord._(
            favouritePost: favouritePost, userName: userName, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
