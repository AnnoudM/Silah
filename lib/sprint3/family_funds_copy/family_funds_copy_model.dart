import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/sprint1/side_admin/side_admin_widget.dart';
import 'family_funds_copy_widget.dart' show FamilyFundsCopyWidget;
import 'package:flutter/material.dart';

class FamilyFundsCopyModel extends FlutterFlowModel<FamilyFundsCopyWidget> {
  ///  Local state fields for this page.

  double? check;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in FamilyFundsCopy widget.
  UsersRecord? user;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 11) {
      return 'المبلغ كبير جدا!';
    }
    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'لا يمكن أن يكون المبلغ فارغ!';
    }
    return null;
  }

  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;
  // Model for sideAdmin component.
  late SideAdminModel sideAdminModel;

  @override
  void initState(BuildContext context) {
    amountTextControllerValidator = _amountTextControllerValidator;
    navBar1Model = createModel(context, () => NavBar1Model());
    sideAdminModel = createModel(context, () => SideAdminModel());
  }

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();

    navBar1Model.dispose();
    sideAdminModel.dispose();
  }
}
