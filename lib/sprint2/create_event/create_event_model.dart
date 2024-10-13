import '/flutter_flow/flutter_flow_util.dart';
import 'create_event_widget.dart' show CreateEventWidget;
import 'package:flutter/material.dart';

class CreateEventModel extends FlutterFlowModel<CreateEventWidget> {
  ///  Local state fields for this component.

  int? photoNumber;

  String? dateEmpty;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for eventName widget.
  FocusNode? eventNameFocusNode;
  TextEditingController? eventNameTextController;
  String? Function(BuildContext, String?)? eventNameTextControllerValidator;
  String? _eventNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 50) {
      return 'العنوان طويل جدا!';
    }
    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'عنوان فارغ!';
    }
    return null;
  }

  // State field(s) for eventLocation widget.
  FocusNode? eventLocationFocusNode;
  TextEditingController? eventLocationTextController;
  String? Function(BuildContext, String?)? eventLocationTextControllerValidator;
  String? _eventLocationTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'موقع فارغ!';
    }
    return null;
  }

  // State field(s) for eventDec widget.
  FocusNode? eventDecFocusNode;
  TextEditingController? eventDecTextController;
  String? Function(BuildContext, String?)? eventDecTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {
    eventNameTextControllerValidator = _eventNameTextControllerValidator;
    eventLocationTextControllerValidator =
        _eventLocationTextControllerValidator;
  }

  @override
  void dispose() {
    eventNameFocusNode?.dispose();
    eventNameTextController?.dispose();

    eventLocationFocusNode?.dispose();
    eventLocationTextController?.dispose();

    eventDecFocusNode?.dispose();
    eventDecTextController?.dispose();
  }
}
