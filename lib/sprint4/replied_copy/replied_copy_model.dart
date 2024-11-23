import '/flutter_flow/flutter_flow_util.dart';
import '/homes/side_bar/side_bar_widget.dart';
import '/sprint3/postitems/postitems_widget.dart';
import 'replied_copy_widget.dart' show RepliedCopyWidget;
import 'package:flutter/material.dart';

class RepliedCopyModel extends FlutterFlowModel<RepliedCopyWidget> {
  ///  Local state fields for this page.

  bool searchactive = false;

  String? selectedCategory;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for postitemsa.
  late PostitemsModel postitemsaModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return ' ';
    }

    if (val.length > 300) {
      return 'الرد طويل جدا!';
    }
    if (!RegExp(
            '^(?=.*\\S)[^A-Za-z]*[\\u0600-\\u06FF0-9\\s?!@#\$%^&*(),.]+[^A-Za-z]*\$')
        .hasMatch(val)) {
      return 'يجب ان لايحتوي الرد على فراغ فقط او احرف انجليزية';
    }
    return null;
  }

  // Model for sideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    postitemsaModel = createModel(context, () => PostitemsModel());
    textControllerValidator = _textControllerValidator;
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    postitemsaModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    sideBarModel.dispose();
  }
}
