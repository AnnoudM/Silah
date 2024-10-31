import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/sprint1/side_admin_copy/side_admin_copy_widget.dart';
import '/sprint2/empty_search/empty_search_widget.dart';
import '/sprint2/emptydirectory/emptydirectory_widget.dart';
import 'dart:math';
import 'directory_page_copy_widget.dart' show DirectoryPageCopyWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class DirectoryPageCopyModel extends FlutterFlowModel<DirectoryPageCopyWidget> {
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
  // Model for sideAdminCopy component.
  late SideAdminCopyModel sideAdminCopyModel;

  @override
  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
    sideAdminCopyModel = createModel(context, () => SideAdminCopyModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBar1Model.dispose();
    sideAdminCopyModel.dispose();
  }
}
