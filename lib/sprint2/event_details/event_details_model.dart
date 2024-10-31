import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sprint2/delete_event_alert/delete_event_alert_widget.dart';
import 'dart:math';
import 'event_details_widget.dart' show EventDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventDetailsModel extends FlutterFlowModel<EventDetailsWidget> {
  ///  Local state fields for this page.

  bool searchactive = false;

  String? eventname = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
