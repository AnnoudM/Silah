import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/homes/side_bar/side_bar_widget.dart';
import 'name_analytics_widget.dart' show NameAnalyticsWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class NameAnalyticsModel extends FlutterFlowModel<NameAnalyticsWidget> {
  ///  Local state fields for this page.

  double? check;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in NameAnalytics widget.
  UsersRecord? user;
  // Model for sideBar component.
  late SideBarModel sideBarModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    sideBarModel.dispose();
  }
}
