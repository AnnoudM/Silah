import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/homes/side_bar/side_bar_widget.dart';
import 'give_adminstrative_role_copy_widget.dart'
    show GiveAdminstrativeRoleCopyWidget;
import 'package:flutter/material.dart';

class GiveAdminstrativeRoleCopyModel
    extends FlutterFlowModel<GiveAdminstrativeRoleCopyWidget> {
  ///  Local state fields for this page.

  double? check;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in giveAdminstrativeRoleCopy widget.
  UsersRecord? user;
  // Model for sideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    sideBarModel.dispose();
  }
}
