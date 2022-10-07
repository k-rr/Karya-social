// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoriesRecord> _$storiesRecordSerializer =
    new _$StoriesRecordSerializer();

class _$StoriesRecordSerializer implements StructuredSerializer<StoriesRecord> {
  @override
  final Iterable<Type> types = const [StoriesRecord, _$StoriesRecord];
  @override
  final String wireName = 'StoriesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.storyTime;
    if (value != null) {
      result
        ..add('story_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.storyViews;
    if (value != null) {
      result
        ..add('story_views')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.story;
    if (value != null) {
      result
        ..add('story')
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
  StoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'story_time':
          result.storyTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'story_views':
          result.storyViews.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'story':
          result.story = serializers.deserialize(value,
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

class _$StoriesRecord extends StoriesRecord {
  @override
  final DocumentReference<Object?>? userName;
  @override
  final DateTime? storyTime;
  @override
  final BuiltList<int>? storyViews;
  @override
  final String? story;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StoriesRecord([void Function(StoriesRecordBuilder)? updates]) =>
      (new StoriesRecordBuilder()..update(updates))._build();

  _$StoriesRecord._(
      {this.userName, this.storyTime, this.storyViews, this.story, this.ffRef})
      : super._();

  @override
  StoriesRecord rebuild(void Function(StoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoriesRecordBuilder toBuilder() => new StoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoriesRecord &&
        userName == other.userName &&
        storyTime == other.storyTime &&
        storyViews == other.storyViews &&
        story == other.story &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, userName.hashCode), storyTime.hashCode),
                storyViews.hashCode),
            story.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StoriesRecord')
          ..add('userName', userName)
          ..add('storyTime', storyTime)
          ..add('storyViews', storyViews)
          ..add('story', story)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StoriesRecordBuilder
    implements Builder<StoriesRecord, StoriesRecordBuilder> {
  _$StoriesRecord? _$v;

  DocumentReference<Object?>? _userName;
  DocumentReference<Object?>? get userName => _$this._userName;
  set userName(DocumentReference<Object?>? userName) =>
      _$this._userName = userName;

  DateTime? _storyTime;
  DateTime? get storyTime => _$this._storyTime;
  set storyTime(DateTime? storyTime) => _$this._storyTime = storyTime;

  ListBuilder<int>? _storyViews;
  ListBuilder<int> get storyViews =>
      _$this._storyViews ??= new ListBuilder<int>();
  set storyViews(ListBuilder<int>? storyViews) =>
      _$this._storyViews = storyViews;

  String? _story;
  String? get story => _$this._story;
  set story(String? story) => _$this._story = story;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StoriesRecordBuilder() {
    StoriesRecord._initializeBuilder(this);
  }

  StoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userName = $v.userName;
      _storyTime = $v.storyTime;
      _storyViews = $v.storyViews?.toBuilder();
      _story = $v.story;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoriesRecord;
  }

  @override
  void update(void Function(StoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StoriesRecord build() => _build();

  _$StoriesRecord _build() {
    _$StoriesRecord _$result;
    try {
      _$result = _$v ??
          new _$StoriesRecord._(
              userName: userName,
              storyTime: storyTime,
              storyViews: _storyViews?.build(),
              story: story,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'storyViews';
        _storyViews?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'StoriesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
