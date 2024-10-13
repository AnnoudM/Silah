import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'draftposts_copy2_widget.dart' show DraftpostsCopy2Widget;
import 'package:flutter/material.dart';

class DraftpostsCopy2Model extends FlutterFlowModel<DraftpostsCopy2Widget> {
  ///  Local state fields for this component.

  bool? imageAttached = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return ' ';
    }

    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'لايمكن ان يحتوي المنشور على فراغ فقط!';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
