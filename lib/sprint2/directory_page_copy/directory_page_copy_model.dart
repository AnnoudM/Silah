import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import 'directory_page_copy_widget.dart' show DirectoryPageCopyWidget;
import 'package:flutter/material.dart';

class DirectoryPageCopyModel extends FlutterFlowModel<DirectoryPageCopyWidget> {
  ///  Local state fields for this page.

  bool searchactive = false;

  ///  State fields for stateful widgets in this page.

  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBar1Model.dispose();
  }
}
