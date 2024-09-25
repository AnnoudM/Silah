import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "Gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "secondName" field.
  String? _secondName;
  String get secondName => _secondName ?? '';
  bool hasSecondName() => _secondName != null;

  // "thirdName" field.
  String? _thirdName;
  String get thirdName => _thirdName ?? '';
  bool hasThirdName() => _thirdName != null;

  // "fourthName" field.
  String? _fourthName;
  String get fourthName => _fourthName ?? '';
  bool hasFourthName() => _fourthName != null;

  // "userPIc" field.
  String? _userPIc;
  String get userPIc => _userPIc ?? '';
  bool hasUserPIc() => _userPIc != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "FamilyName" field.
  DocumentReference? _familyName;
  DocumentReference? get familyName => _familyName;
  bool hasFamilyName() => _familyName != null;

  // "Accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  // "Rejected" field.
  bool? _rejected;
  bool get rejected => _rejected ?? false;
  bool hasRejected() => _rejected != null;

  // "FullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  void _initializeFields() {
    _password = snapshotData['Password'] as String?;
    _gender = snapshotData['Gender'] as String?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _secondName = snapshotData['secondName'] as String?;
    _thirdName = snapshotData['thirdName'] as String?;
    _fourthName = snapshotData['fourthName'] as String?;
    _userPIc = snapshotData['userPIc'] as String?;
    _uid = snapshotData['uid'] as String?;
    _familyName = snapshotData['FamilyName'] as DocumentReference?;
    _accepted = snapshotData['Accepted'] as bool?;
    _rejected = snapshotData['Rejected'] as bool?;
    _fullName = snapshotData['FullName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? password,
  String? gender,
  bool? isAdmin,
  DateTime? createdTime,
  String? email,
  String? displayName,
  String? phoneNumber,
  String? secondName,
  String? thirdName,
  String? fourthName,
  String? userPIc,
  String? uid,
  DocumentReference? familyName,
  bool? accepted,
  bool? rejected,
  String? fullName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Password': password,
      'Gender': gender,
      'isAdmin': isAdmin,
      'created_time': createdTime,
      'email': email,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'secondName': secondName,
      'thirdName': thirdName,
      'fourthName': fourthName,
      'userPIc': userPIc,
      'uid': uid,
      'FamilyName': familyName,
      'Accepted': accepted,
      'Rejected': rejected,
      'FullName': fullName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.password == e2?.password &&
        e1?.gender == e2?.gender &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.createdTime == e2?.createdTime &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.secondName == e2?.secondName &&
        e1?.thirdName == e2?.thirdName &&
        e1?.fourthName == e2?.fourthName &&
        e1?.userPIc == e2?.userPIc &&
        e1?.uid == e2?.uid &&
        e1?.familyName == e2?.familyName &&
        e1?.accepted == e2?.accepted &&
        e1?.rejected == e2?.rejected &&
        e1?.fullName == e2?.fullName;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.password,
        e?.gender,
        e?.isAdmin,
        e?.createdTime,
        e?.email,
        e?.displayName,
        e?.phoneNumber,
        e?.secondName,
        e?.thirdName,
        e?.fourthName,
        e?.userPIc,
        e?.uid,
        e?.familyName,
        e?.accepted,
        e?.rejected,
        e?.fullName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
