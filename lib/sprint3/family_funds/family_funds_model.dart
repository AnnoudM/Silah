import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/sprint1/side_admin/side_admin_widget.dart';
import 'family_funds_widget.dart' show FamilyFundsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

    if (val.length > 11) {
      return 'المبلغ كبير جدا!';
    }
    if (!RegExp('^(?!0\$).+\$').hasMatch(val)) {
      return 'لا يمكن ان يكون المبلغ صفر';
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
