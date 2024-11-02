import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/homes/side_bar/side_bar_widget.dart';
import 'directory_page_widget.dart' show DirectoryPageWidget;
import 'package:flutter/material.dart';

class DirectoryPageModel extends FlutterFlowModel<DirectoryPageWidget> {
  ///  Local state fields for this page.

  bool searchactive = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBar1Model.dispose();
    sideBarModel.dispose();
  }
}
