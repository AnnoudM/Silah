import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlbumRecord extends FirestoreRecord {
  AlbumRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "FamilyID" field.
  DocumentReference? _familyID;
  DocumentReference? get familyID => _familyID;
  bool hasFamilyID() => _familyID != null;

  // "UserID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _photo = snapshotData['Photo'] as String?;
    _familyID = snapshotData['FamilyID'] as DocumentReference?;
    _userID = snapshotData['UserID'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Album');

  static Stream<AlbumRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlbumRecord.fromSnapshot(s));

  static Future<AlbumRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlbumRecord.fromSnapshot(s));

  static AlbumRecord fromSnapshot(DocumentSnapshot snapshot) => AlbumRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlbumRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlbumRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlbumRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlbumRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlbumRecordData({
  String? photo,
  DocumentReference? familyID,
  DocumentReference? userID,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Photo': photo,
      'FamilyID': familyID,
      'UserID': userID,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlbumRecordDocumentEquality implements Equality<AlbumRecord> {
  const AlbumRecordDocumentEquality();

  @override
  bool equals(AlbumRecord? e1, AlbumRecord? e2) {
    return e1?.photo == e2?.photo &&
        e1?.familyID == e2?.familyID &&
        e1?.userID == e2?.userID &&
        e1?.time == e2?.time;
  }

  @override
  int hash(AlbumRecord? e) =>
      const ListEquality().hash([e?.photo, e?.familyID, e?.userID, e?.time]);

  @override
  bool isValidKey(Object? o) => o is AlbumRecord;
}
