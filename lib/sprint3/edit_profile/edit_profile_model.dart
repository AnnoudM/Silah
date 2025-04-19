import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class FormFieldGroup {
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller;
  final String? Function(BuildContext, String?) validator;

  FormFieldGroup({
    required String initialValue,
    required this.validator,
  }) : controller = TextEditingController(text: initialValue);
}

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  /// Local state fields
  bool? matchPass = true;
  bool genderChosen = true;
  bool? emaiExist = false;
  bool? phonExist = false;
  String? photo;

  /// Upload state
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile = FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Global Form key
  final formKey = GlobalKey<FormState>();

  /// Dynamic field map
  final Map<String, FormFieldGroup> formFields = {};

  /// Email field
  final FocusNode emailFocusNode = FocusNode();
  final TextEditingController emailTextController = TextEditingController();
  late String? Function(BuildContext, String?) emailTextControllerValidator;

  /// Firestore outputs
  UsersRecord? emailExi;
  UsersRecord? phoneExCopyCopy;
  UsersRecord? emailEx;
  UsersRecord? emailExie;

  @override
  void initState(BuildContext context) {
    formFields['fullName'] = FormFieldGroup(
      initialValue: '',
      validator: (context, val) {
        if (val == null || val.isEmpty) return 'هذا الحقل مطلوب';
        if (val.length > 50) return 'الاسم طويل جدا';
        if (!RegExp(r'^(?!\s*$).+').hasMatch(val)) return 'اسم فارغ!';
        return null;
      },
    );

    formFields['fatherName'] = FormFieldGroup(
      initialValue: '',
      validator: (context, val) {
        if (val == null || val.isEmpty) return 'هذا الحقل مطلوب';
        return null;
      },
    );

    formFields['bio'] = FormFieldGroup(
      initialValue: '',
      validator: (context, val) {
        if (val == null || val.isEmpty) return 'هذا الحقل مطلوب';
        if (val.length > 300) return 'Maximum 300 characters allowed, currently ${val.length}.';
        return null;
      },
    );

    formFields['phone'] = FormFieldGroup(
      initialValue: '',
      validator: (context, val) {
        if (val == null || val.isEmpty) return 'هذا الحقل مطلوب';
        if (val.length > 10) return 'رقم الهاتف مكون من 10 خانات فقط';
        if (!RegExp(r'^05\d{8}$').hasMatch(val)) return 'يجب ان يبدأ الرقم ب05 ويتكون من 10 أرقام';
        return null;
      },
    );

    emailTextControllerValidator = (context, val) {
      if (val == null || val.isEmpty) return 'هذا الحقل مطلوب';
      if (val.length > 150) return 'البريد الإلكتروني طويل جدا';
      if (!RegExp(r'^[\w\-.]+@[\w\-.]+\.[a-zA-Z]{2,}$').hasMatch(val)) {
        return 'يرجى إدخال بريد إلكتروني صحيح بدون\nمسافات وفي الصياغة التالية (xxx@xxx.xxx)';
      }
      return null;
    };
  }

  @override
  void dispose() {
    for (final field in formFields.values) {
      field.focusNode.dispose();
      field.controller.dispose();
    }

    emailFocusNode.dispose();
    emailTextController.dispose();
  }
}
