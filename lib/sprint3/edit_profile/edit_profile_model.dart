import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  bool? matchPass = true;

  bool genderChosen = true;

  bool? emaiExist = false;

  bool? phonExist = false;

  String? photo;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 50) {
      return 'الاسم طويل جدا';
    }
    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'اسم فارغ!';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 50) {
      return 'الاسم طويل جدا';
    }
    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'الاسم فارغ!';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 50) {
      return 'الاسم طويل جدا';
    }
    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'اسم فارغ!';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 50) {
      return 'الاسم طويل جدا';
    }
    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'اسم فارغ!';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  String? _textController5Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 50) {
      return 'الاسم طويل جدا';
    }
    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'اسم فارغ!';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  String? _textController6Validator(BuildContext context, String? val) {
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

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  String? _textController7Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 10) {
      return 'رقم الهاتف مكون من 10 خانات فقط';
    }
    if (!RegExp('^05\\d{8}\$').hasMatch(val)) {
      return 'يجب ان يبدأ الرقم ب05 ويتكون من 10 أرقام';
    }
    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
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

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? emailExi;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? phoneEx;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? emailEx;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? emailExie;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    textController4Validator = _textController4Validator;
    textController5Validator = _textController5Validator;
    textController6Validator = _textController6Validator;
    textController7Validator = _textController7Validator;
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
