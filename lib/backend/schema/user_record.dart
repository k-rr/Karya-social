import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_record.g.dart';

abstract class UserRecord implements Built<UserRecord, UserRecordBuilder> {
  static Serializer<UserRecord> get serializer => _$userRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get password;

  @BuiltValueField(wireName: 'conform_password')
  String? get conformPassword;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'Bio')
  String? get bio;

  bool? get isonline;

  @BuiltValueField(wireName: 'followers_user')
  BuiltList<DocumentReference>? get followersUser;

  BuiltList<DocumentReference>? get following;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..uid = ''
    ..phoneNumber = ''
    ..password = ''
    ..conformPassword = ''
    ..photoUrl = ''
    ..bio = ''
    ..isonline = false
    ..followersUser = ListBuilder()
    ..following = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserRecord._();
  factory UserRecord([void Function(UserRecordBuilder) updates]) = _$UserRecord;

  static UserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? password,
  String? conformPassword,
  String? photoUrl,
  String? bio,
  bool? isonline,
}) {
  final firestoreData = serializers.toFirestore(
    UserRecord.serializer,
    UserRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..password = password
        ..conformPassword = conformPassword
        ..photoUrl = photoUrl
        ..bio = bio
        ..isonline = isonline
        ..followersUser = null
        ..following = null,
    ),
  );

  return firestoreData;
}
