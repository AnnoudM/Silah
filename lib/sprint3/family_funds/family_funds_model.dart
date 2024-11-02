import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/homes/side_bar/side_bar_widget.dart';
import 'family_funds_widget.dart' show FamilyFundsWidget;
import 'package:flutter/material.dart';

class FamilyFundsModel extends FlutterFlowModel<FamilyFundsWidget> {
  ///  Local state fields for this page.

  double? check;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in FamilyFunds widget.
  UsersRecord? user;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 6) {
      return 'لا يمكن أن يكون المبلغ أكبر \nمن 999.999\$';
    }
    if (!RegExp('^(?!0+\$)\\d+\$').hasMatch(val)) {
      return 'لا يمكن ان يكون المبلغ صفر';
    }
    return null;
  }

  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;
  // Model for sideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    amountTextControllerValidator = _amountTextControllerValidator;
    navBar1Model = createModel(context, () => NavBar1Model());
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();

    navBar1Model.dispose();
    sideBarModel.dispose();
  }
}
