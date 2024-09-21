import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'side_admin_model.dart';
export 'side_admin_model.dart';

class SideAdminWidget extends StatefulWidget {
  const SideAdminWidget({super.key});

  @override
  State<SideAdminWidget> createState() => _SideAdminWidgetState();
}

class _SideAdminWidgetState extends State<SideAdminWidget> {
  late SideAdminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideAdminModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<UsersRecord> columnUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final columnUsersRecord = columnUsersRecordList.isNotEmpty
            ? columnUsersRecordList.first
            : null;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: const BoxDecoration(
                color: Color(0xFF2A497D),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: const Color(0xFF2A497D),
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: const Color(0xFF2A497D),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 18.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            columnUsersRecord!.displayName,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Text(
                          columnUsersRecord.email,
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w100,
                              ),
                        ),
                      ]
                          .divide(const SizedBox(height: 4.0))
                          .around(const SizedBox(height: 4.0)),
                    ),
                  ].divide(const SizedBox(width: 16.0)).around(const SizedBox(width: 16.0)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.7,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('settings');
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 25.0,
                        ),
                        title: Text(
                          'الملف الشخصي',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('settings');
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.settings_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 25.0,
                        ),
                        title: Text(
                          'الإعدادات',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setDarkModeSetting(
                          context,
                          FFAppState().DarkMode
                              ? ThemeMode.dark
                              : ThemeMode.light,
                        );
                      },
                      child: ListTile(
                        key: ValueKey(FFAppState().DarkMode.toString()),
                        leading: Icon(
                          key: ValueKey(FFAppState().DarkMode.toString()),
                          Icons.mode_night_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 25.0,
                        ),
                        title: Text(
                          'الوضع الليلي',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('requestsCopyCopy');
                      },
                      child: ListTile(
                        key: ValueKey(FFAppState().DarkMode.toString()),
                        leading: Icon(
                          key: ValueKey(FFAppState().DarkMode.toString()),
                          Icons.group_add_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 25.0,
                        ),
                        title: Text(
                          'قبول/رفض اضافة للعائلة',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.3,
              child: Divider(
                height: 1.0,
                thickness: 0.75,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('تسجيل خروج'),
                              content:
                                  const Text('هل انت متأكد من طلبك لتسجيل الخروج؟'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: const Text('لا'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: const Text('نعم'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      context.pushNamedAuth('initialPage', context.mounted);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.logout_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 25.0,
                    ),
                    title: Text(
                      'تسجيل خروج\n',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: false,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
