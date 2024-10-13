import '/flutter_flow/flutter_flow_util.dart';
import 'edit_event_widget.dart' show EditEventWidget;
import 'package:flutter/material.dart';

class EditEventModel extends FlutterFlowModel<EditEventWidget> {
  ///  Local state fields for this page.

  bool searchactive = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for EventDes widget.
  FocusNode? eventDesFocusNode;
  TextEditingController? eventDesTextController;
  String? Function(BuildContext, String?)? eventDesTextControllerValidator;
  // State field(s) for loc widget.
  FocusNode? locFocusNode;
  TextEditingController? locTextController;
  String? Function(BuildContext, String?)? locTextControllerValidator;
  // State field(s) for Date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? Function(BuildContext, String?)? dateTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    eventDesFocusNode?.dispose();
    eventDesTextController?.dispose();

    locFocusNode?.dispose();
    locTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();
  }
}
