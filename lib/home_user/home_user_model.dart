import '/backend/backend.dart';
import '/components/side_user_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_user_widget.dart' show HomeUserWidget;
import 'package:flutter/material.dart';

class HomeUserModel extends FlutterFlowModel<HomeUserWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomeUser widget.
  UsersRecord? user;
  // Model for sideUser component.
  late SideUserModel sideUserModel;

  @override
  void initState(BuildContext context) {
    sideUserModel = createModel(context, () => SideUserModel());
  }

  @override
  void dispose() {
    sideUserModel.dispose();
  }
}
