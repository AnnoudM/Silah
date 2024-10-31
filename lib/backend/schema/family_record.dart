import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FamilyRecord extends FirestoreRecord {
  FamilyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "FamilyDesc" field.
  String? _familyDesc;
  String get familyDesc => _familyDesc ?? '';
  bool hasFamilyDesc() => _familyDesc != null;

  // "Posts" field.
  List<DocumentReference>? _posts;
  List<DocumentReference> get posts => _posts ?? const [];
  bool hasPosts() => _posts != null;

  // "FamilyAdmin" field.
  String? _familyAdmin;
  String get familyAdmin => _familyAdmin ?? '';
  bool hasFamilyAdmin() => _familyAdmin != null;

  // "Events" field.
  List<DocumentReference>? _events;
  List<DocumentReference> get events => _events ?? const [];
  bool hasEvents() => _events != null;

  // "FamilyName" field.
  String? _familyName;
  String get familyName => _familyName ?? '';
  bool hasFamilyName() => _familyName != null;

  void _initializeFields() {
    _familyDesc = snapshotData['FamilyDesc'] as String?;
    _posts = getDataList(snapshotData['Posts']);
    _familyAdmin = snapshotData['FamilyAdmin'] as String?;
    _events = getDataList(snapshotData['Events']);
    _familyName = snapshotData['FamilyName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Family');

  static Stream<FamilyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FamilyRecord.fromSnapshot(s));

  static Future<FamilyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FamilyRecord.fromSnapshot(s));

  static FamilyRecord fromSnapshot(DocumentSnapshot snapshot) => FamilyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FamilyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FamilyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FamilyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FamilyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFamilyRecordData({
  String? familyDesc,
  String? familyAdmin,
  String? familyName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FamilyDesc': familyDesc,
      'FamilyAdmin': familyAdmin,
      'FamilyName': familyName,
    }.withoutNulls,
  );

  return firestoreData;
}

class FamilyRecordDocumentEquality implements Equality<FamilyRecord> {
  const FamilyRecordDocumentEquality();

  @override
  bool equals(FamilyRecord? e1, FamilyRecord? e2) {
    const listEquality = ListEquality();
    return e1?.familyDesc == e2?.familyDesc &&
        listEquality.equals(e1?.posts, e2?.posts) &&
        e1?.familyAdmin == e2?.familyAdmin &&
        listEquality.equals(e1?.events, e2?.events) &&
        e1?.familyName == e2?.familyName;
  }

  @override
  int hash(FamilyRecord? e) => const ListEquality().hash(
      [e?.familyDesc, e?.posts, e?.familyAdmin, e?.events, e?.familyName]);

  @override
  bool isValidKey(Object? o) => o is FamilyRecord;
}
