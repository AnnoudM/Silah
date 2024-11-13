import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_bar1_model.dart';
export 'nav_bar1_model.dart';

class NavBar1Widget extends StatefulWidget {
  const NavBar1Widget({
    super.key,
    this.currentpage,
  });

  final String? currentpage;

  @override
  State<NavBar1Widget> createState() => _NavBar1WidgetState();
}

class _NavBar1WidgetState extends State<NavBar1Widget> {
  late NavBar1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBar1Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 90.0,
        decoration: const BoxDecoration(
          color: Color(0x00EEEEEE),
        ),
        child: Stack(
          alignment: const AlignmentDirectional(-0.0, 0.0),
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 0.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 80.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFCF6),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Color(0x1A57636C),
                          offset: Offset(
                            0.0,
                            -10.0,
                          ),
                          spreadRadius: 0.1,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Semantics(
                  label: 'دليل العائلة',
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.people,
                      color: FFAppState().currentPage == 'DirectoryPage'
                          ? const Color(0xFF2A497D)
                          : const Color(0xFF9299A1),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('DirectoryPage');
                    },
                  ),
                ),
                Semantics(
                  label: 'المنشورات',
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.post_add,
                      color: FFAppState().currentPage == 'posts'
                          ? const Color(0xFF2A497D)
                          : const Color(0xFF9299A1),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        'postsCopy',
                        queryParameters: {
                          'currentpage': serializeParam(
                            'posts',
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: StreamBuilder<List<UsersRecord>>(
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
                          List<UsersRecord> middleButtonUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final middleButtonUsersRecord =
                              middleButtonUsersRecordList.isNotEmpty
                                  ? middleButtonUsersRecordList.first
                                  : null;

                          return Semantics(
                            label: 'الصفحة الرئيسية',
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 25.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              fillColor: const Color(0xFF2A497D),
                              icon: const Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                if (middleButtonUsersRecord?.isAdmin == true) {
                                  context.pushNamed('HomeAdmin');

                                  FFAppState().currentPage = 'home';
                                  safeSetState(() {});
                                } else {
                                  context.pushNamed('HomeUser');

                                  safeSetState(() {});
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: const Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Color(0xFF9299A1),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('Album');
                  },
                ),
                Semantics(
                  label: 'التقويم',
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.date_range_rounded,
                      color: FFAppState().currentPage == 'CalenderPage'
                          ? const Color(0xFF2A497F)
                          : const Color(0xFF9299A1),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('CalenderPage');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
