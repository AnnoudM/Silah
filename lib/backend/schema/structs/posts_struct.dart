// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsStruct extends FFFirebaseStruct {
  PostsStruct({
    String? category,
    String? content,
    String? postID,
    DocumentReference? familyID,
    DocumentReference? userID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        _content = content,
        _postID = postID,
        _familyID = familyID,
        _userID = userID,
        super(firestoreUtilData);

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "Content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "PostID" field.
  String? _postID;
  String get postID => _postID ?? '';
  set postID(String? val) => _postID = val;

  bool hasPostID() => _postID != null;

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

  static PostsStruct fromMap(Map<String, dynamic> data) => PostsStruct(
        category: data['Category'] as String?,
        content: data['Content'] as String?,
        postID: data['PostID'] as String?,
        familyID: data['FamilyID'] as DocumentReference?,
        userID: data['UserID'] as DocumentReference?,
      );

  static PostsStruct? maybeFromMap(dynamic data) =>
      data is Map ? PostsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Category': _category,
        'Content': _content,
        'PostID': _postID,
        'FamilyID': _familyID,
        'UserID': _userID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Category': serializeParam(
          _category,
          ParamType.String,
        ),
        'Content': serializeParam(
          _content,
          ParamType.String,
        ),
        'PostID': serializeParam(
          _postID,
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

  static PostsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostsStruct(
        category: deserializeParam(
          data['Category'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['Content'],
          ParamType.String,
          false,
        ),
        postID: deserializeParam(
          data['PostID'],
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
  String toString() => 'PostsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostsStruct &&
        category == other.category &&
        content == other.content &&
        postID == other.postID &&
        familyID == other.familyID &&
        userID == other.userID;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([category, content, postID, familyID, userID]);
}

PostsStruct createPostsStruct({
  String? category,
  String? content,
  String? postID,
  DocumentReference? familyID,
  DocumentReference? userID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostsStruct(
      category: category,
      content: content,
      postID: postID,
      familyID: familyID,
      userID: userID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostsStruct? updatePostsStruct(
  PostsStruct? posts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    posts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostsStructData(
  Map<String, dynamic> firestoreData,
  PostsStruct? posts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (posts == null) {
    return;
  }
  if (posts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && posts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postsData = getPostsFirestoreData(posts, forFieldValue);
  final nestedData = postsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = posts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostsFirestoreData(
  PostsStruct? posts, [
  bool forFieldValue = false,
]) {
  if (posts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(posts.toMap());

  // Add any Firestore field values
  posts.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostsListFirestoreData(
  List<PostsStruct>? postss,
) =>
    postss?.map((e) => getPostsFirestoreData(e, true)).toList() ?? [];
