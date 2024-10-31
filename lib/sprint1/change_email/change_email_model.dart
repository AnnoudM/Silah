import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'change_email_widget.dart' show ChangeEmailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangeEmailModel extends FlutterFlowModel<ChangeEmailWidget> {
  ///  Local state fields for this component.

  bool? email = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 150) {
      return 'البريد الإلكتروني طويل جدا';
    }
    if (!RegExp('^[\\w\\-.]+@[\\w\\-.]+\\.[a-zA-Z]{2,}\$').hasMatch(val)) {
      return 'يرجى إدخال بريد إلكتروني صحيح بدون\nمسافات وفي الصياغة التالية (xxx@xxx.xxx)';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  UsersRecord? emailE;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? equal;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? userLoggedInnCopy;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
