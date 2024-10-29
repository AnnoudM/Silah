import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'share_post_widget.dart' show SharePostWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class SharePostModel extends FlutterFlowModel<SharePostWidget> {
  ///  Local state fields for this component.

  bool? imageAttached = false;

  bool? emptychoice = false;

  bool? emptytext = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return ' حقل مطلوب';
    }

    if (!RegExp(
            '^(?=.*\\S)[^A-Za-z]*[\\u0600-\\u06FF0-9\\s?!@#\$%^&*(),.]+[^A-Za-z]*\$')
        .hasMatch(val)) {
      return 'يجب ان لايحتوي المنشور على احرف انجليزية\nأو على فراغ فقط';
    }
    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostsRecord? post;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? usersFamily;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
