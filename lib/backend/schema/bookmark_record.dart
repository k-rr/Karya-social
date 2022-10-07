import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bookmark_record.g.dart';

abstract class BookmarkRecord
    implements Built<BookmarkRecord, BookmarkRecordBuilder> {
  static Serializer<BookmarkRecord> get serializer =>
      _$bookmarkRecordSerializer;

  @BuiltValueField(wireName: 'favourite_post')
  String? get favouritePost;

  @BuiltValueField(wireName: 'user_name')
  DocumentReference? get userName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BookmarkRecordBuilder builder) =>
      builder..favouritePost = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookmark');

  static Stream<BookmarkRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BookmarkRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BookmarkRecord._();
  factory BookmarkRecord([void Function(BookmarkRecordBuilder) updates]) =
      _$BookmarkRecord;

  static BookmarkRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBookmarkRecordData({
  String? favouritePost,
  DocumentReference? userName,
}) {
  final firestoreData = serializers.toFirestore(
    BookmarkRecord.serializer,
    BookmarkRecord(
      (b) => b
        ..favouritePost = favouritePost
        ..userName = userName,
    ),
  );

  return firestoreData;
}
