import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/homes/side_bar/side_bar_widget.dart';
import 'posts_widget.dart' show PostsWidget;
import 'package:flutter/material.dart';

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
