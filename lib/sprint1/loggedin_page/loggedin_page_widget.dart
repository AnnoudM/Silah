import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loggedin_page_model.dart';
export 'loggedin_page_model.dart';

class LoggedinPageWidget extends StatefulWidget {
  const LoggedinPageWidget({
    super.key,
    this.familyname,
  });

  final String? familyname;

  @override
  State<LoggedinPageWidget> createState() => _LoggedinPageWidgetState();
}

class _LoggedinPageWidgetState extends State<LoggedinPageWidget> {
  late LoggedinPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoggedinPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await authManager.refreshUser();
      _model.user = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.user?.isAdmin == true) {
        if (currentUserEmailVerified) {
          context.pushNamed('HomeAdmin');

          return;
        } else {
          context.pushNamed(
            'verification',
            queryParameters: {
              'email': serializeParam(
                _model.user?.email,
                ParamType.String,
              ),
            }.withoutNulls,
          );

          return;
        }
      } else {
        if (_model.user!.accepted) {
          context.pushNamed('HomeUser');

          return;
        } else {
          if (_model.user?.rejected == true) {
            context.pushNamed('RejectPage');

            return;
          } else {
            context.pushNamed('PendingPage');

            return;
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFFCF6),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                width: 100.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2A497D), Color(0xFF2A497D)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.87, -1.0),
                    end: AlignmentDirectional(-0.87, 1.0),
                  ),
                ),
                alignment: AlignmentDirectional(0.0, -1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
