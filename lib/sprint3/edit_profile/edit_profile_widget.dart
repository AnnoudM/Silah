import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/sprint3/cancel_editprofile/cancel_editprofile_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'edit_profile_model.dart';

export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    super.key,
    required this.userEdit,
  });

  final DocumentReference? userEdit;

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());
    _model.initState(context);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        title: Text('تعديل الملف الشخصي'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _model.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField(
                context: context,
                label: 'الاسم *',
                fieldKey: 'fullName',
              ),
              const SizedBox(height: 16),
              buildTextField(
                context: context,
                label: 'اسم الأب *',
                fieldKey: 'fatherName',
              ),
              const SizedBox(height: 16),
              buildTextField(
                context: context,
                label: 'نبذة عنك *',
                fieldKey: 'bio',
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              buildTextField(
                context: context,
                label: 'رقم الجوال *',
                fieldKey: 'phone',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _model.emailTextController,
                focusNode: _model.emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                validator: (val) => _model.emailTextControllerValidator(context, val),
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني *',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                ),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.center,
                child: FFButtonWidget(
                  onPressed: () {
                    if (_model.formKey.currentState!.validate()) {
                      // Submit logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم الحفظ بنجاح')),
                      );
                    }
                  },
                  text: 'حفظ',
                  options: FFButtonOptions(
                    width: 200,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required BuildContext context,
    required String label,
    required String fieldKey,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.name,
  }) {
    final field = _model.formFields[fieldKey]!;

    return TextFormField(
      controller: field.controller,
      focusNode: field.focusNode,
      validator: (val) => field.validator(context, val),
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: fieldKey == 'phone'
          ? [FilteringTextInputFormatter.digitsOnly]
          : [FilteringTextInputFormatter.allow(RegExp('[\\u0621-\\u064A\\s]'))],
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
      ),
    );
  }
  
}
