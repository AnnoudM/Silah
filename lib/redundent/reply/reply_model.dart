import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reply_widget.dart' show ReplyWidget;
import 'package:flutter/material.dart';

class ReplyModel extends FlutterFlowModel<ReplyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField_3 widget.
  FocusNode? textField3FocusNode;
  TextEditingController? textField3TextController;
  String? Function(BuildContext, String?)? textField3TextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReplyRecord? output;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField3FocusNode?.dispose();
    textField3TextController?.dispose();
  }
}
