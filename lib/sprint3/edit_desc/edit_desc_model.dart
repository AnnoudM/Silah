import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/sprint1/side_admin/side_admin_widget.dart';
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
    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'لا يمكن أن تكون النبذة فارغة!';
    }
    return null;
  }

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;
  // Model for sideAdmin component.
  late SideAdminModel sideAdminModel;

  @override
  void initState(BuildContext context) {
    familyDecTextControllerValidator = _familyDecTextControllerValidator;
    navBar1Model = createModel(context, () => NavBar1Model());
    sideAdminModel = createModel(context, () => SideAdminModel());
  }

  @override
  void dispose() {
    familyDecFocusNode?.dispose();
    familyDecTextController?.dispose();

    navBar1Model.dispose();
    sideAdminModel.dispose();
  }
}
