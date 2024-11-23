import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "familyId" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  bool hasFamilyId() => _familyId != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "postid" field.
  DocumentReference? _postid;
  DocumentReference? get postid => _postid;
  bool hasPostid() => _postid != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "eventid" field.
  DocumentReference? _eventid;
  DocumentReference? get eventid => _eventid;
  bool hasEventid() => _eventid != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "isRequest" field.
  bool? _isRequest;
  bool get isRequest => _isRequest ?? false;
  bool hasIsRequest() => _isRequest != null;

  void _initializeFields() {
    _familyId = snapshotData['familyId'] as DocumentReference?;
    _userId = snapshotData['userId'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _message = snapshotData['message'] as String?;
    _postid = snapshotData['postid'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _eventid = snapshotData['eventid'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _isRequest = snapshotData['isRequest'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? familyId,
  DocumentReference? userId,
  String? title,
  String? message,
  DocumentReference? postid,
  DateTime? createdAt,
  DocumentReference? eventid,
  String? type,
  bool? isRequest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'familyId': familyId,
      'userId': userId,
      'title': title,
      'message': message,
      'postid': postid,
      'createdAt': createdAt,
      'eventid': eventid,
      'type': type,
      'isRequest': isRequest,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.familyId == e2?.familyId &&
        e1?.userId == e2?.userId &&
        e1?.title == e2?.title &&
        e1?.message == e2?.message &&
        e1?.postid == e2?.postid &&
        e1?.createdAt == e2?.createdAt &&
        e1?.eventid == e2?.eventid &&
        e1?.type == e2?.type &&
        e1?.isRequest == e2?.isRequest;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.familyId,
        e?.userId,
        e?.title,
        e?.message,
        e?.postid,
        e?.createdAt,
        e?.eventid,
        e?.type,
        e?.isRequest
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
