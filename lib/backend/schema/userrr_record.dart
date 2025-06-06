import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserrrRecord extends FirestoreRecord {
  UserrrRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "familyName" field.
  DocumentReference? _familyName;
  DocumentReference? get familyName => _familyName;
  bool hasFamilyName() => _familyName != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _token = snapshotData['token'] as String?;
    _familyName = snapshotData['familyName'] as DocumentReference?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userrr');

  static Stream<UserrrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserrrRecord.fromSnapshot(s));

  static Future<UserrrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserrrRecord.fromSnapshot(s));

  static UserrrRecord fromSnapshot(DocumentSnapshot snapshot) => UserrrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserrrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserrrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserrrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserrrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserrrRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? token,
  DocumentReference? familyName,
  bool? isAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'token': token,
      'familyName': familyName,
      'isAdmin': isAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserrrRecordDocumentEquality implements Equality<UserrrRecord> {
  const UserrrRecordDocumentEquality();

  @override
  bool equals(UserrrRecord? e1, UserrrRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.token == e2?.token &&
        e1?.familyName == e2?.familyName &&
        e1?.isAdmin == e2?.isAdmin;
  }

  @override
  int hash(UserrrRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.token,
        e?.familyName,
        e?.isAdmin
      ]);

  @override
  bool isValidKey(Object? o) => o is UserrrRecord;
}
