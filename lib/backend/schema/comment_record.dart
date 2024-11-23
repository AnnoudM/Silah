import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentRecord extends FirestoreRecord {
  CommentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "timeReplied" field.
  DateTime? _timeReplied;
  DateTime? get timeReplied => _timeReplied;
  bool hasTimeReplied() => _timeReplied != null;

  // "postId" field.
  DocumentReference? _postId;
  DocumentReference? get postId => _postId;
  bool hasPostId() => _postId != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _userId = snapshotData['userId'] as DocumentReference?;
    _timeReplied = snapshotData['timeReplied'] as DateTime?;
    _postId = snapshotData['postId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Comment');

  static Stream<CommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentRecord.fromSnapshot(s));

  static Future<CommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentRecord.fromSnapshot(s));

  static CommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentRecordData({
  String? content,
  DocumentReference? userId,
  DateTime? timeReplied,
  DocumentReference? postId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'userId': userId,
      'timeReplied': timeReplied,
      'postId': postId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentRecordDocumentEquality implements Equality<CommentRecord> {
  const CommentRecordDocumentEquality();

  @override
  bool equals(CommentRecord? e1, CommentRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.userId == e2?.userId &&
        e1?.timeReplied == e2?.timeReplied &&
        e1?.postId == e2?.postId;
  }

  @override
  int hash(CommentRecord? e) => const ListEquality()
      .hash([e?.content, e?.userId, e?.timeReplied, e?.postId]);

  @override
  bool isValidKey(Object? o) => o is CommentRecord;
}
