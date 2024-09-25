// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AlbumStruct extends FFFirebaseStruct {
  AlbumStruct({
    String? photo,
    DocumentReference? familyID,
    DocumentReference? userID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _photo = photo,
        _familyID = familyID,
        _userID = userID,
        super(firestoreUtilData);

  // "Photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;

  bool hasPhoto() => _photo != null;

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

  static AlbumStruct fromMap(Map<String, dynamic> data) => AlbumStruct(
        photo: data['Photo'] as String?,
        familyID: data['FamilyID'] as DocumentReference?,
        userID: data['UserID'] as DocumentReference?,
      );

  static AlbumStruct? maybeFromMap(dynamic data) =>
      data is Map ? AlbumStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Photo': _photo,
        'FamilyID': _familyID,
        'UserID': _userID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Photo': serializeParam(
          _photo,
          ParamType.String,
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

  static AlbumStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlbumStruct(
        photo: deserializeParam(
          data['Photo'],
          ParamType.String,
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
  String toString() => 'AlbumStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AlbumStruct &&
        photo == other.photo &&
        familyID == other.familyID &&
        userID == other.userID;
  }

  @override
  int get hashCode => const ListEquality().hash([photo, familyID, userID]);
}

AlbumStruct createAlbumStruct({
  String? photo,
  DocumentReference? familyID,
  DocumentReference? userID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AlbumStruct(
      photo: photo,
      familyID: familyID,
      userID: userID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AlbumStruct? updateAlbumStruct(
  AlbumStruct? album, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    album
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAlbumStructData(
  Map<String, dynamic> firestoreData,
  AlbumStruct? album,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (album == null) {
    return;
  }
  if (album.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && album.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final albumData = getAlbumFirestoreData(album, forFieldValue);
  final nestedData = albumData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = album.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAlbumFirestoreData(
  AlbumStruct? album, [
  bool forFieldValue = false,
]) {
  if (album == null) {
    return {};
  }
  final firestoreData = mapToFirestore(album.toMap());

  // Add any Firestore field values
  album.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAlbumListFirestoreData(
  List<AlbumStruct>? albums,
) =>
    albums?.map((e) => getAlbumFirestoreData(e, true)).toList() ?? [];
