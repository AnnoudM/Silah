import '/backend/backend.dart';
import '/components/side_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_admin_widget.dart' show HomeAdminWidget;
import 'package:flutter/material.dart';

class HomeAdminModel extends FlutterFlowModel<HomeAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomeAdmin widget.
  UsersRecord? user;
  // Model for sideAdmin component.
  late SideAdminModel sideAdminModel;

  @override
  void initState(BuildContext context) {
    sideAdminModel = createModel(context, () => SideAdminModel());
  }

  @override
  void dispose() {
    sideAdminModel.dispose();
  }
}
