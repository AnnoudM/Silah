// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsStruct extends FFFirebaseStruct {
  RequestsStruct({
    bool? accepted,
    DocumentReference? familyID,
    DocumentReference? userID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accepted = accepted,
        _familyID = familyID,
        _userID = userID,
        super(firestoreUtilData);

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  set accepted(bool? val) => _accepted = val;

  bool hasAccepted() => _accepted != null;

  // "FamilyID" field.
  DocumentReference? _familyID;
  DocumentReference? get familyID => _familyID;
  set familyID(DocumentReference? val) => _familyID = val;

  bool hasFamilyID() => _familyID != null;

  // "UserID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  set userID(DocumentReference? val) => _userID = val;

  bool hasUserID() => _userID != null;

  static RequestsStruct fromMap(Map<String, dynamic> data) => RequestsStruct(
        accepted: data['accepted'] as bool?,
        familyID: data['FamilyID'] as DocumentReference?,
        userID: data['UserID'] as DocumentReference?,
      );

  static RequestsStruct? maybeFromMap(dynamic data) =>
      data is Map ? RequestsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'accepted': _accepted,
        'FamilyID': _familyID,
        'UserID': _userID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'accepted': serializeParam(
          _accepted,
          ParamType.bool,
        ),
        'FamilyID': serializeParam(
          _familyID,
          ParamType.DocumentReference,
        ),
        'UserID': serializeParam(
          _userID,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static RequestsStruct fromSerializableMap(Map<String, dynamic> data) =>
      RequestsStruct(
        accepted: deserializeParam(
          data['accepted'],
          ParamType.bool,
          false,
        ),
        familyID: deserializeParam(
          data['FamilyID'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Family'],
        ),
        userID: deserializeParam(
          data['UserID'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Users'],
        ),
      );

  @override
  String toString() => 'RequestsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RequestsStruct &&
        accepted == other.accepted &&
        familyID == other.familyID &&
        userID == other.userID;
  }

  @override
  int get hashCode => const ListEquality().hash([accepted, familyID, userID]);
}

RequestsStruct createRequestsStruct({
  bool? accepted,
  DocumentReference? familyID,
  DocumentReference? userID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RequestsStruct(
      accepted: accepted,
      familyID: familyID,
      userID: userID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RequestsStruct? updateRequestsStruct(
  RequestsStruct? requests, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    requests
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRequestsStructData(
  Map<String, dynamic> firestoreData,
  RequestsStruct? requests,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (requests == null) {
    return;
  }
  if (requests.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && requests.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final requestsData = getRequestsFirestoreData(requests, forFieldValue);
  final nestedData = requestsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = requests.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRequestsFirestoreData(
  RequestsStruct? requests, [
  bool forFieldValue = false,
]) {
  if (requests == null) {
    return {};
  }
  final firestoreData = mapToFirestore(requests.toMap());

  // Add any Firestore field values
  requests.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRequestsListFirestoreData(
  List<RequestsStruct>? requestss,
) =>
    requestss?.map((e) => getRequestsFirestoreData(e, true)).toList() ?? [];
