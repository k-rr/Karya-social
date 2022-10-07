import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'post_comment_record.g.dart';

abstract class PostCommentRecord
    implements Built<PostCommentRecord, PostCommentRecordBuilder> {
  static Serializer<PostCommentRecord> get serializer =>
      _$postCommentRecordSerializer;

  String? get comments;

  @BuiltValueField(wireName: 'commented_time')
  DateTime? get commentedTime;

  @BuiltValueField(wireName: 'user_name')
  BuiltList<DocumentReference>? get userName;

  @BuiltValueField(wireName: 'user_img')
  String? get userImg;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PostCommentRecordBuilder builder) => builder
    ..comments = ''
    ..userName = ListBuilder()
    ..userImg = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('post_comment')
          : FirebaseFirestore.instance.collectionGroup('post_comment');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('post_comment').doc();

  static Stream<PostCommentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostCommentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PostCommentRecord._();
  factory PostCommentRecord([void Function(PostCommentRecordBuilder) updates]) =
      _$PostCommentRecord;

  static PostCommentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostCommentRecordData({
  String? comments,
  DateTime? commentedTime,
  String? userImg,
}) {
  final firestoreData = serializers.toFirestore(
    PostCommentRecord.serializer,
    PostCommentRecord(
      (p) => p
        ..comments = comments
        ..commentedTime = commentedTime
        ..userName = null
        ..userImg = userImg,
    ),
  );

  return firestoreData;
}
