// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FamilyStruct extends FFFirebaseStruct {
  FamilyStruct({
    String? familyDesc,
    List<DocumentReference>? posts,
    String? familyAdmin,
    List<DocumentReference>? events,
    String? familyName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _familyDesc = familyDesc,
        _posts = posts,
        _familyAdmin = familyAdmin,
        _events = events,
        _familyName = familyName,
        super(firestoreUtilData);

  // "FamilyDesc" field.
  String? _familyDesc;
  String get familyDesc => _familyDesc ?? '';
  set familyDesc(String? val) => _familyDesc = val;

  bool hasFamilyDesc() => _familyDesc != null;

  // "Posts" field.
  List<DocumentReference>? _posts;
  List<DocumentReference> get posts => _posts ?? const [];
  set posts(List<DocumentReference>? val) => _posts = val;

  void updatePosts(Function(List<DocumentReference>) updateFn) {
    updateFn(_posts ??= []);
  }

  bool hasPosts() => _posts != null;

  // "FamilyAdmin" field.
  String? _familyAdmin;
  String get familyAdmin => _familyAdmin ?? '';
  set familyAdmin(String? val) => _familyAdmin = val;

  bool hasFamilyAdmin() => _familyAdmin != null;

  // "Events" field.
  List<DocumentReference>? _events;
  List<DocumentReference> get events => _events ?? const [];
  set events(List<DocumentReference>? val) => _events = val;

  void updateEvents(Function(List<DocumentReference>) updateFn) {
    updateFn(_events ??= []);
  }

  bool hasEvents() => _events != null;

  // "FamilyName" field.
  String? _familyName;
  String get familyName => _familyName ?? '';
  set familyName(String? val) => _familyName = val;

  bool hasFamilyName() => _familyName != null;

  static FamilyStruct fromMap(Map<String, dynamic> data) => FamilyStruct(
        familyDesc: data['FamilyDesc'] as String?,
        posts: getDataList(data['Posts']),
        familyAdmin: data['FamilyAdmin'] as String?,
        events: getDataList(data['Events']),
        familyName: data['FamilyName'] as String?,
      );

  static FamilyStruct? maybeFromMap(dynamic data) =>
      data is Map ? FamilyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'FamilyDesc': _familyDesc,
        'Posts': _posts,
        'FamilyAdmin': _familyAdmin,
        'Events': _events,
        'FamilyName': _familyName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'FamilyDesc': serializeParam(
          _familyDesc,
          ParamType.String,
        ),
        'Posts': serializeParam(
          _posts,
          ParamType.DocumentReference,
          isList: true,
        ),
        'FamilyAdmin': serializeParam(
          _familyAdmin,
          ParamType.String,
        ),
        'Events': serializeParam(
          _events,
          ParamType.DocumentReference,
          isList: true,
        ),
        'FamilyName': serializeParam(
          _familyName,
          ParamType.String,
        ),
      }.withoutNulls;

  static FamilyStruct fromSerializableMap(Map<String, dynamic> data) =>
      FamilyStruct(
        familyDesc: deserializeParam(
          data['FamilyDesc'],
          ParamType.String,
          false,
        ),
        posts: deserializeParam<DocumentReference>(
          data['Posts'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Posts'],
        ),
        familyAdmin: deserializeParam(
          data['FamilyAdmin'],
          ParamType.String,
          false,
        ),
        events: deserializeParam<DocumentReference>(
          data['Events'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Events'],
        ),
        familyName: deserializeParam(
          data['FamilyName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FamilyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FamilyStruct &&
        familyDesc == other.familyDesc &&
        listEquality.equals(posts, other.posts) &&
        familyAdmin == other.familyAdmin &&
        listEquality.equals(events, other.events) &&
        familyName == other.familyName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([familyDesc, posts, familyAdmin, events, familyName]);
}

FamilyStruct createFamilyStruct({
  String? familyDesc,
  String? familyAdmin,
  String? familyName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FamilyStruct(
      familyDesc: familyDesc,
      familyAdmin: familyAdmin,
      familyName: familyName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FamilyStruct? updateFamilyStruct(
  FamilyStruct? family, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    family
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFamilyStructData(
  Map<String, dynamic> firestoreData,
  FamilyStruct? family,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (family == null) {
    return;
  }
  if (family.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && family.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final familyData = getFamilyFirestoreData(family, forFieldValue);
  final nestedData = familyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = family.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFamilyFirestoreData(
  FamilyStruct? family, [
  bool forFieldValue = false,
]) {
  if (family == null) {
    return {};
  }
  final firestoreData = mapToFirestore(family.toMap());

  // Add any Firestore field values
  family.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFamilyListFirestoreData(
  List<FamilyStruct>? familys,
) =>
    familys?.map((e) => getFamilyFirestoreData(e, true)).toList() ?? [];
