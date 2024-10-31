import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/sprint1/side_admin/side_admin_widget.dart';
import 'home_admin_widget.dart' show HomeAdminWidget;
import 'package:flutter/material.dart';

class HomeAdminModel extends FlutterFlowModel<HomeAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFcmToken] action in HomeAdmin widget.
  String? token;
  // Stores action output result for [Firestore Query - Query a collection] action in HomeAdmin widget.
  UsersRecord? user;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;
  // Model for sideAdmin component.
  late SideAdminModel sideAdminModel;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
    sideAdminModel = createModel(context, () => SideAdminModel());
  }

  @override
  void dispose() {
    navBar1Model.dispose();
    sideAdminModel.dispose();
  }
}
