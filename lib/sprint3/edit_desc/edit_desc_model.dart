import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/homes/side_bar/side_bar_widget.dart';
import 'edit_desc_widget.dart' show EditDescWidget;
import 'package:flutter/material.dart';

class EditDescModel extends FlutterFlowModel<EditDescWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in EditDesc widget.
  UsersRecord? user;
  // State field(s) for familyDec widget.
  FocusNode? familyDecFocusNode;
  TextEditingController? familyDecTextController;
  String? Function(BuildContext, String?)? familyDecTextControllerValidator;
  String? _familyDecTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 300) {
      return 'Maximum 300 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(
            '^(?=.*\\S)[^A-Za-z]*[\\u0600-\\u06FF0-9\\s?!@#\$%^&*(),.]+[^A-Za-z]*\$')
        .hasMatch(val)) {
      return 'يجب ان لاتحتوي النبذة على أحرف\nانجليزية أو على فراغ فقط!';
    }
    return null;
  }

  // Model for sideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    familyDecTextControllerValidator = _familyDecTextControllerValidator;
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    familyDecFocusNode?.dispose();
    familyDecTextController?.dispose();

    sideBarModel.dispose();
  }
}
