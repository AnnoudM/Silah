import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/sprint1/sideuser_copy/sideuser_copy_widget.dart';
import 'home_user_widget.dart' show HomeUserWidget;
import 'package:flutter/material.dart';

class HomeUserModel extends FlutterFlowModel<HomeUserWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomeUser widget.
  UsersRecord? user;
  // Model for sideuserCopy component.
  late SideuserCopyModel sideuserCopyModel;

  @override
  void initState(BuildContext context) {
    sideuserCopyModel = createModel(context, () => SideuserCopyModel());
  }

  @override
  void dispose() {
    sideuserCopyModel.dispose();
  }
}
