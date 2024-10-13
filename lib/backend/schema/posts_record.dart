import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "Content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "PostID" field.
  String? _postID;
  String get postID => _postID ?? '';
  bool hasPostID() => _postID != null;

  // "FamilyID" field.
  DocumentReference? _familyID;
  DocumentReference? get familyID => _familyID;
  bool hasFamilyID() => _familyID != null;

  // "UserID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "DatePosted" field.
  DateTime? _datePosted;
  DateTime? get datePosted => _datePosted;
  bool hasDatePosted() => _datePosted != null;

  // "postContent" field.
  String? _postContent;
  String get postContent => _postContent ?? '';
  bool hasPostContent() => _postContent != null;

  // "likedBy" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "numLike" field.
  int? _numLike;
  int get numLike => _numLike ?? 0;
  bool hasNumLike() => _numLike != null;

  void _initializeFields() {
    _category = snapshotData['Category'] as String?;
    _content = snapshotData['Content'] as String?;
    _postID = snapshotData['PostID'] as String?;
    _familyID = snapshotData['FamilyID'] as DocumentReference?;
    _userID = snapshotData['UserID'] as DocumentReference?;
    _datePosted = snapshotData['DatePosted'] as DateTime?;
    _postContent = snapshotData['postContent'] as String?;
    _likedBy = getDataList(snapshotData['likedBy']);
    _numLike = castToType<int>(snapshotData['numLike']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? category,
  String? content,
  String? postID,
  DocumentReference? familyID,
  DocumentReference? userID,
  DateTime? datePosted,
  String? postContent,
  int? numLike,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Category': category,
      'Content': content,
      'PostID': postID,
      'FamilyID': familyID,
      'UserID': userID,
      'DatePosted': datePosted,
      'postContent': postContent,
      'numLike': numLike,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.category == e2?.category &&
        e1?.content == e2?.content &&
        e1?.postID == e2?.postID &&
        e1?.familyID == e2?.familyID &&
        e1?.userID == e2?.userID &&
        e1?.datePosted == e2?.datePosted &&
        e1?.postContent == e2?.postContent &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        e1?.numLike == e2?.numLike;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.category,
        e?.content,
        e?.postID,
        e?.familyID,
        e?.userID,
        e?.datePosted,
        e?.postContent,
        e?.likedBy,
        e?.numLike
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
