import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stories_record.g.dart';

abstract class StoriesRecord
    implements Built<StoriesRecord, StoriesRecordBuilder> {
  static Serializer<StoriesRecord> get serializer => _$storiesRecordSerializer;

  @BuiltValueField(wireName: 'user_name')
  DocumentReference? get userName;

  @BuiltValueField(wireName: 'story_time')
  DateTime? get storyTime;

  @BuiltValueField(wireName: 'story_views')
  BuiltList<int>? get storyViews;

  String? get story;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StoriesRecordBuilder builder) => builder
    ..storyViews = ListBuilder()
    ..story = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stories');

  static Stream<StoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StoriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StoriesRecord._();
  factory StoriesRecord([void Function(StoriesRecordBuilder) updates]) =
      _$StoriesRecord;

  static StoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStoriesRecordData({
  DocumentReference? userName,
  DateTime? storyTime,
  String? story,
}) {
  final firestoreData = serializers.toFirestore(
    StoriesRecord.serializer,
    StoriesRecord(
      (s) => s
        ..userName = userName
        ..storyTime = storyTime
        ..storyViews = null
        ..story = story,
    ),
  );

  return firestoreData;
}
