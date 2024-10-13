import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'replytothread_widget.dart' show ReplytothreadWidget;
import 'package:flutter/material.dart';

class ReplytothreadModel extends FlutterFlowModel<ReplytothreadWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField_3 widget.
  FocusNode? textField3FocusNode;
  TextEditingController? textField3TextController;
  String? Function(BuildContext, String?)? textField3TextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField3FocusNode?.dispose();
    textField3TextController?.dispose();
  }
}
