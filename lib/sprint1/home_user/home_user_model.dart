import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/homes/side_bar/side_bar_widget.dart';
import 'home_user_widget.dart' show HomeUserWidget;
import 'package:flutter/material.dart';

class HomeUserModel extends FlutterFlowModel<HomeUserWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFcmToken] action in HomeUser widget.
  String? token;
  // Stores action output result for [Firestore Query - Query a collection] action in HomeUser widget.
  UsersRecord? user;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;
  // Model for sideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    navBar1Model.dispose();
    sideBarModel.dispose();
  }
}
