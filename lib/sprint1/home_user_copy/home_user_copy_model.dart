import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sprint1/sideuser_copy/sideuser_copy_widget.dart';
import 'home_user_copy_widget.dart' show HomeUserCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeUserCopyModel extends FlutterFlowModel<HomeUserCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomeUserCopy widget.
  UsersRecord? user;
  // Model for sideuserCopy component.
  late SideuserCopyModel sideuserCopyModel;

  @override
  void initState(BuildContext context) {
    sideuserCopyModel = createModel(context, () => SideuserCopyModel());
  }

  @override
  void dispose() {
    sideuserCopyModel.dispose();
  }
}
