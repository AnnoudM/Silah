import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/sprint1/side_admin_copy/side_admin_copy_widget.dart';
import '/sprint2/empty_posts/empty_posts_widget.dart';
import '/sprint2/postitems/postitems_widget.dart';
import '/sprint2/share_post/share_post_widget.dart';
import 'dart:math';
import 'posts_widget.dart' show PostsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostsModel extends FlutterFlowModel<PostsWidget> {
  ///  Local state fields for this page.

  bool searchactive = false;

  String? selectedCategory;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
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
    navBar1Model.dispose();
    sideAdminCopyModel.dispose();
  }
}
