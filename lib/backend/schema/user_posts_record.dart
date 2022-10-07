import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_posts_record.g.dart';

abstract class UserPostsRecord
    implements Built<UserPostsRecord, UserPostsRecordBuilder> {
  static Serializer<UserPostsRecord> get serializer =>
      _$userPostsRecordSerializer;

  @BuiltValueField(wireName: 'post_image')
  String? get postImage;

  @BuiltValueField(wireName: 'post_title')
  String? get postTitle;

  @BuiltValueField(wireName: 'post_time')
  DateTime? get postTime;

  @BuiltValueField(wireName: 'post_video')
  String? get postVideo;

  @BuiltValueField(wireName: 'user_img')
  DocumentReference? get userImg;

  @BuiltValueField(wireName: 'post_user_name')
  DocumentReference? get postUserName;

  BuiltList<DocumentReference>? get likedBy;

  @BuiltValueField(wireName: 'commnet_time')
  DateTime? get commnetTime;

  BuiltList<DocumentReference>? get commentBy;

  BuiltList<String>? get comments;

  @BuiltValueField(wireName: 'is_favourite')
  bool? get isFavourite;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserPostsRecordBuilder builder) => builder
    ..postImage = ''
    ..postTitle = ''
    ..postVideo = ''
    ..likedBy = ListBuilder()
    ..commentBy = ListBuilder()
    ..comments = ListBuilder()
    ..isFavourite = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_posts')
          : FirebaseFirestore.instance.collectionGroup('user_posts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_posts').doc();

  static Stream<UserPostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserPostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserPostsRecord._();
  factory UserPostsRecord([void Function(UserPostsRecordBuilder) updates]) =
      _$UserPostsRecord;

  static UserPostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserPostsRecordData({
  String? postImage,
  String? postTitle,
  DateTime? postTime,
  String? postVideo,
  DocumentReference? userImg,
  DocumentReference? postUserName,
  DateTime? commnetTime,
  bool? isFavourite,
}) {
  final firestoreData = serializers.toFirestore(
    UserPostsRecord.serializer,
    UserPostsRecord(
      (u) => u
        ..postImage = postImage
        ..postTitle = postTitle
        ..postTime = postTime
        ..postVideo = postVideo
        ..userImg = userImg
        ..postUserName = postUserName
        ..likedBy = null
        ..commnetTime = commnetTime
        ..commentBy = null
        ..comments = null
        ..isFavourite = isFavourite,
    ),
  );

  return firestoreData;
}
