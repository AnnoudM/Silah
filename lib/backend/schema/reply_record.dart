import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReplyRecord extends FirestoreRecord {
  ReplyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Reply_content" field.
  String? _replyContent;
  String get replyContent => _replyContent ?? '';
  bool hasReplyContent() => _replyContent != null;

  // "Reply_user" field.
  DocumentReference? _replyUser;
  DocumentReference? get replyUser => _replyUser;
  bool hasReplyUser() => _replyUser != null;

  // "time_replied" field.
  DateTime? _timeReplied;
  DateTime? get timeReplied => _timeReplied;
  bool hasTimeReplied() => _timeReplied != null;

  // "ReplyPost" field.
  DocumentReference? _replyPost;
  DocumentReference? get replyPost => _replyPost;
  bool hasReplyPost() => _replyPost != null;

  // "ReplyTo" field.
  DocumentReference? _replyTo;
  DocumentReference? get replyTo => _replyTo;
  bool hasReplyTo() => _replyTo != null;

  // "liked_By" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "num_like" field.
  int? _numLike;
  int get numLike => _numLike ?? 0;
  bool hasNumLike() => _numLike != null;

  // "num_reply" field.
  int? _numReply;
  int get numReply => _numReply ?? 0;
  bool hasNumReply() => _numReply != null;

  // "replied_by" field.
  List<DocumentReference>? _repliedBy;
  List<DocumentReference> get repliedBy => _repliedBy ?? const [];
  bool hasRepliedBy() => _repliedBy != null;

  // "reply_replies" field.
  List<DocumentReference>? _replyReplies;
  List<DocumentReference> get replyReplies => _replyReplies ?? const [];
  bool hasReplyReplies() => _replyReplies != null;

  // "parent_reply" field.
  DocumentReference? _parentReply;
  DocumentReference? get parentReply => _parentReply;
  bool hasParentReply() => _parentReply != null;

  void _initializeFields() {
    _replyContent = snapshotData['Reply_content'] as String?;
    _replyUser = snapshotData['Reply_user'] as DocumentReference?;
    _timeReplied = snapshotData['time_replied'] as DateTime?;
    _replyPost = snapshotData['ReplyPost'] as DocumentReference?;
    _replyTo = snapshotData['ReplyTo'] as DocumentReference?;
    _likedBy = getDataList(snapshotData['liked_By']);
    _numLike = castToType<int>(snapshotData['num_like']);
    _numReply = castToType<int>(snapshotData['num_reply']);
    _repliedBy = getDataList(snapshotData['replied_by']);
    _replyReplies = getDataList(snapshotData['reply_replies']);
    _parentReply = snapshotData['parent_reply'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reply');

  static Stream<ReplyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReplyRecord.fromSnapshot(s));

  static Future<ReplyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReplyRecord.fromSnapshot(s));

  static ReplyRecord fromSnapshot(DocumentSnapshot snapshot) => ReplyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReplyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReplyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReplyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReplyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReplyRecordData({
  String? replyContent,
  DocumentReference? replyUser,
  DateTime? timeReplied,
  DocumentReference? replyPost,
  DocumentReference? replyTo,
  int? numLike,
  int? numReply,
  DocumentReference? parentReply,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Reply_content': replyContent,
      'Reply_user': replyUser,
      'time_replied': timeReplied,
      'ReplyPost': replyPost,
      'ReplyTo': replyTo,
      'num_like': numLike,
      'num_reply': numReply,
      'parent_reply': parentReply,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReplyRecordDocumentEquality implements Equality<ReplyRecord> {
  const ReplyRecordDocumentEquality();

  @override
  bool equals(ReplyRecord? e1, ReplyRecord? e2) {
    const listEquality = ListEquality();
    return e1?.replyContent == e2?.replyContent &&
        e1?.replyUser == e2?.replyUser &&
        e1?.timeReplied == e2?.timeReplied &&
        e1?.replyPost == e2?.replyPost &&
        e1?.replyTo == e2?.replyTo &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        e1?.numLike == e2?.numLike &&
        e1?.numReply == e2?.numReply &&
        listEquality.equals(e1?.repliedBy, e2?.repliedBy) &&
        listEquality.equals(e1?.replyReplies, e2?.replyReplies) &&
        e1?.parentReply == e2?.parentReply;
  }

  @override
  int hash(ReplyRecord? e) => const ListEquality().hash([
        e?.replyContent,
        e?.replyUser,
        e?.timeReplied,
        e?.replyPost,
        e?.replyTo,
        e?.likedBy,
        e?.numLike,
        e?.numReply,
        e?.repliedBy,
        e?.replyReplies,
        e?.parentReply
      ]);

  @override
  bool isValidKey(Object? o) => o is ReplyRecord;
}
