import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chat_collection_record.g.dart';

abstract class ChatCollectionRecord
    implements Built<ChatCollectionRecord, ChatCollectionRecordBuilder> {
  static Serializer<ChatCollectionRecord> get serializer =>
      _$chatCollectionRecordSerializer;

  String? get msgBox;

  DocumentReference? get username;

  DateTime? get msgsentdatetime;

  String? get mediaurl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChatCollectionRecordBuilder builder) => builder
    ..msgBox = ''
    ..mediaurl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ChatCollection');

  static Stream<ChatCollectionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatCollectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatCollectionRecord._();
  factory ChatCollectionRecord(
          [void Function(ChatCollectionRecordBuilder) updates]) =
      _$ChatCollectionRecord;

  static ChatCollectionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatCollectionRecordData({
  String? msgBox,
  DocumentReference? username,
  DateTime? msgsentdatetime,
  String? mediaurl,
}) {
  final firestoreData = serializers.toFirestore(
    ChatCollectionRecord.serializer,
    ChatCollectionRecord(
      (c) => c
        ..msgBox = msgBox
        ..username = username
        ..msgsentdatetime = msgsentdatetime
        ..mediaurl = mediaurl,
    ),
  );

  return firestoreData;
}
