import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sign_up_admin_widget.dart' show SignUpAdminWidget;
import 'package:flutter/material.dart';

class SignUpAdminModel extends FlutterFlowModel<SignUpAdminWidget> {
  ///  Local state fields for this page.

  bool? matchPass = true;

  bool genderChosen = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
    if (!RegExp('^[\\u0600-\\u06FF0-9\\s\\p{P}،.]+\$').hasMatch(val)) {
      return 'Invalid text';
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

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 150) {
      return 'البريد الإلكتروني طويل جدا';
    }
    if (!RegExp('^[\\w-\\.]+@([\\w-]+\\.)+[a-zA-Z]{2,}\$').hasMatch(val)) {
      return 'يرجى إدخال بريد إلكتروني صحيح بدون\nمسافات وفي الصياغة التالية (xxx@xxx.xxx)';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length > 20) {
      return 'كلمة المرور طويلة جدا';
    }
    if (!RegExp(
            '^(?!.*[\\u0600-\\u06FF])(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d\\S]{8,}\$')
        .hasMatch(val)) {
      return 'كلمة المرور لا تحقق الشروط';
    }
    return null;
  }

  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;
  String? _passwordConfirmTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FamilyRecord? familyExist;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? phoneExist;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? emailExist;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? userLoggedInn;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FamilyRecord? newFamily;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UsersRecord? users;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    textController4Validator = _textController4Validator;
    textController5Validator = _textController5Validator;
    textController6Validator = _textController6Validator;
    textController7Validator = _textController7Validator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    passwordConfirmVisibility = false;
    passwordConfirmTextControllerValidator =
        _passwordConfirmTextControllerValidator;
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

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();
  }
}
