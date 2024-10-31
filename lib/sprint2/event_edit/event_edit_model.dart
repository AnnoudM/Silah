import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'event_edit_widget.dart' show EventEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventEditModel extends FlutterFlowModel<EventEditWidget> {
  ///  Local state fields for this page.

  bool searchactive = false;

  String? eventname;

  String? dateEmpty;

  String? dateChanged;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for eventName widget.
  FocusNode? eventNameFocusNode;
  TextEditingController? eventNameTextController;
  String? Function(BuildContext, String?)? eventNameTextControllerValidator;
  String? _eventNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 30) {
      return 'العنوان طويل جدا!';
    }
    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'لا يمكن أن يكون عنوان المناسبة فارغًا!';
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

    if (val.length > 255) {
      return 'الموقع طويل جدا!';
    }
    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'لا يمكن أن يكون الموقع فارغًا!';
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
