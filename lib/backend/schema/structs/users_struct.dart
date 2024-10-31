// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersStruct extends FFFirebaseStruct {
  UsersStruct({
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
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _password = password,
        _gender = gender,
        _isAdmin = isAdmin,
        _createdTime = createdTime,
        _email = email,
        _displayName = displayName,
        _phoneNumber = phoneNumber,
        _secondName = secondName,
        _thirdName = thirdName,
        _fourthName = fourthName,
        _userPIc = userPIc,
        _uid = uid,
        _familyName = familyName,
        _accepted = accepted,
        _rejected = rejected,
        super(firestoreUtilData);

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "Gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  set isAdmin(bool? val) => _isAdmin = val;

  bool hasIsAdmin() => _isAdmin != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "secondName" field.
  String? _secondName;
  String get secondName => _secondName ?? '';
  set secondName(String? val) => _secondName = val;

  bool hasSecondName() => _secondName != null;

  // "thirdName" field.
  String? _thirdName;
  String get thirdName => _thirdName ?? '';
  set thirdName(String? val) => _thirdName = val;

  bool hasThirdName() => _thirdName != null;

  // "fourthName" field.
  String? _fourthName;
  String get fourthName => _fourthName ?? '';
  set fourthName(String? val) => _fourthName = val;

  bool hasFourthName() => _fourthName != null;

  // "userPIc" field.
  String? _userPIc;
  String get userPIc => _userPIc ?? '';
  set userPIc(String? val) => _userPIc = val;

  bool hasUserPIc() => _userPIc != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "FamilyName" field.
  DocumentReference? _familyName;
  DocumentReference? get familyName => _familyName;
  set familyName(DocumentReference? val) => _familyName = val;

  bool hasFamilyName() => _familyName != null;

  // "Accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  set accepted(bool? val) => _accepted = val;

  bool hasAccepted() => _accepted != null;

  // "Rejected" field.
  bool? _rejected;
  bool get rejected => _rejected ?? false;
  set rejected(bool? val) => _rejected = val;

  bool hasRejected() => _rejected != null;

  static UsersStruct fromMap(Map<String, dynamic> data) => UsersStruct(
        password: data['Password'] as String?,
        gender: data['Gender'] as String?,
        isAdmin: data['isAdmin'] as bool?,
        createdTime: data['created_time'] as DateTime?,
        email: data['email'] as String?,
        displayName: data['display_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        secondName: data['secondName'] as String?,
        thirdName: data['thirdName'] as String?,
        fourthName: data['fourthName'] as String?,
        userPIc: data['userPIc'] as String?,
        uid: data['uid'] as String?,
        familyName: data['FamilyName'] as DocumentReference?,
        accepted: data['Accepted'] as bool?,
        rejected: data['Rejected'] as bool?,
      );

  static UsersStruct? maybeFromMap(dynamic data) =>
      data is Map ? UsersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Password': _password,
        'Gender': _gender,
        'isAdmin': _isAdmin,
        'created_time': _createdTime,
        'email': _email,
        'display_name': _displayName,
        'phone_number': _phoneNumber,
        'secondName': _secondName,
        'thirdName': _thirdName,
        'fourthName': _fourthName,
        'userPIc': _userPIc,
        'uid': _uid,
        'FamilyName': _familyName,
        'Accepted': _accepted,
        'Rejected': _rejected,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Password': serializeParam(
          _password,
          ParamType.String,
        ),
        'Gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'isAdmin': serializeParam(
          _isAdmin,
          ParamType.bool,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'secondName': serializeParam(
          _secondName,
          ParamType.String,
        ),
        'thirdName': serializeParam(
          _thirdName,
          ParamType.String,
        ),
        'fourthName': serializeParam(
          _fourthName,
          ParamType.String,
        ),
        'userPIc': serializeParam(
          _userPIc,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'FamilyName': serializeParam(
          _familyName,
          ParamType.DocumentReference,
        ),
        'Accepted': serializeParam(
          _accepted,
          ParamType.bool,
        ),
        'Rejected': serializeParam(
          _rejected,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UsersStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsersStruct(
        password: deserializeParam(
          data['Password'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['Gender'],
          ParamType.String,
          false,
        ),
        isAdmin: deserializeParam(
          data['isAdmin'],
          ParamType.bool,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        secondName: deserializeParam(
          data['secondName'],
          ParamType.String,
          false,
        ),
        thirdName: deserializeParam(
          data['thirdName'],
          ParamType.String,
          false,
        ),
        fourthName: deserializeParam(
          data['fourthName'],
          ParamType.String,
          false,
        ),
        userPIc: deserializeParam(
          data['userPIc'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        familyName: deserializeParam(
          data['FamilyName'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Family'],
        ),
        accepted: deserializeParam(
          data['Accepted'],
          ParamType.bool,
          false,
        ),
        rejected: deserializeParam(
          data['Rejected'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UsersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsersStruct &&
        password == other.password &&
        gender == other.gender &&
        isAdmin == other.isAdmin &&
        createdTime == other.createdTime &&
        email == other.email &&
        displayName == other.displayName &&
        phoneNumber == other.phoneNumber &&
        secondName == other.secondName &&
        thirdName == other.thirdName &&
        fourthName == other.fourthName &&
        userPIc == other.userPIc &&
        uid == other.uid &&
        familyName == other.familyName &&
        accepted == other.accepted &&
        rejected == other.rejected;
  }

  @override
  int get hashCode => const ListEquality().hash([
        password,
        gender,
        isAdmin,
        createdTime,
        email,
        displayName,
        phoneNumber,
        secondName,
        thirdName,
        fourthName,
        userPIc,
        uid,
        familyName,
        accepted,
        rejected
      ]);
}

UsersStruct createUsersStruct({
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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsersStruct(
      password: password,
      gender: gender,
      isAdmin: isAdmin,
      createdTime: createdTime,
      email: email,
      displayName: displayName,
      phoneNumber: phoneNumber,
      secondName: secondName,
      thirdName: thirdName,
      fourthName: fourthName,
      userPIc: userPIc,
      uid: uid,
      familyName: familyName,
      accepted: accepted,
      rejected: rejected,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsersStruct? updateUsersStruct(
  UsersStruct? users, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    users
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsersStructData(
  Map<String, dynamic> firestoreData,
  UsersStruct? users,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (users == null) {
    return;
  }
  if (users.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && users.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usersData = getUsersFirestoreData(users, forFieldValue);
  final nestedData = usersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = users.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsersFirestoreData(
  UsersStruct? users, [
  bool forFieldValue = false,
]) {
  if (users == null) {
    return {};
  }
  final firestoreData = mapToFirestore(users.toMap());

  // Add any Firestore field values
  users.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsersListFirestoreData(
  List<UsersStruct>? userss,
) =>
    userss?.map((e) => getUsersFirestoreData(e, true)).toList() ?? [];
