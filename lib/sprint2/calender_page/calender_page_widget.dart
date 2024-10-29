import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/sprint1/side_admin_copy/side_admin_copy_widget.dart';
import '/sprint2/create_event/create_event_widget.dart';
import '/sprint2/empty_event_day/empty_event_day_widget.dart';
import '/sprint2/empty_pre_event/empty_pre_event_widget.dart';
import '/sprint2/emptyevents/emptyevents_widget.dart';
import '/sprint2/emptymyevent/emptymyevent_widget.dart';
import '/sprint2/event/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'calender_page_model.dart';
export 'calender_page_model.dart';

class CalenderPageWidget extends StatefulWidget {
  ///
  const CalenderPageWidget({
    super.key,
    this.famName,
    this.currentPage,
  });

  final FamilyRecord? famName;
  final String? currentPage;

  @override
  State<CalenderPageWidget> createState() => _CalenderPageWidgetState();
}

class _CalenderPageWidgetState extends State<CalenderPageWidget>
    with TickerProviderStateMixin {
  late CalenderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().currentPage = 'CalenderPage';
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 140.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.9, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-0.349, 0),
            end: const Offset(0, 0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

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
          return Scaffold(
            backgroundColor: const Color(0xFFFFFCF6),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> calenderPageUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final calenderPageUsersRecord = calenderPageUsersRecordList.isNotEmpty
            ? calenderPageUsersRecordList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFFFFCF6),
            drawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.sideAdminCopyModel,
                updateCallback: () => safeSetState(() {}),
                child: const SideAdminCopyWidget(),
              ),
            ),
            body: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: 100.0,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF2A497D), Color(0xFF2A497D)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.87, -1.0),
                            end: AlignmentDirectional(-0.87, 1.0),
                          ),
                        ),
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 25.0, 25.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.menu_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            scaffoldKey.currentState!
                                                .openDrawer();
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(2.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  200.0, 0.0, 0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/SilahFINALLogo.jpg',
                                              width: 153.0,
                                              height: 95.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 610.0,
                                  constraints: const BoxConstraints(
                                    maxWidth: 570.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFCF6),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Container(
                                      height: double.infinity,
                                      constraints: const BoxConstraints(
                                        maxWidth: 500.0,
                                      ),
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 54.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: StreamBuilder<
                                                              FamilyRecord>(
                                                            stream: FamilyRecord
                                                                .getDocument(
                                                                    calenderPageUsersRecord!
                                                                        .familyName!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final textFamilyRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return Text(
                                                                'تقويم العائلة ',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: const Color(
                                                                          0xFF2A497D),
                                                                      fontSize:
                                                                          23.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 335.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFFFFCF6),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 46.0, 0.0, 0.0),
                                                  child: FlutterFlowCalendar(
                                                    color: const Color(0xFF2A497D),
                                                    iconColor:
                                                        const Color(0xFF2A497D),
                                                    weekFormat: false,
                                                    weekStartsMonday: false,
                                                    initialDate:
                                                        getCurrentTimestamp,
                                                    rowHeight: 40.0,
                                                    onChange: (DateTimeRange?
                                                        newSelectedDate) async {
                                                      if (_model
                                                              .calendarSelectedDay ==
                                                          newSelectedDate) {
                                                        return;
                                                      }
                                                      _model.calendarSelectedDay =
                                                          newSelectedDate;
                                                      safeSetState(() {
                                                        _model
                                                            .choiceChipsValueController
                                                            ?.value = [
                                                          'مناسبات اليوم'
                                                        ];
                                                      });
                                                      _model.eventselect =
                                                          'مناسبات اليوم';
                                                      safeSetState(() {});
                                                      safeSetState(() {});
                                                    },
                                                    titleStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color:
                                                              const Color(0xFF828282),
                                                          fontSize: 15.5,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    dayOfWeekStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                    dateStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                    selectedDateStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                    inactiveDateStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: const Color(
                                                                  0xFF3F393F),
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(6.0),
                                                    child: Text(
                                                      'المناسبات ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child:
                                                              FlutterFlowChoiceChips(
                                                            options: const [
                                                              ChipData(
                                                                  'القادمة'),
                                                              ChipData(
                                                                  'مناسبات اليوم'),
                                                              ChipData(
                                                                  'مناسباتي'),
                                                              ChipData(
                                                                  'السابقة')
                                                            ],
                                                            onChanged:
                                                                (val) async {
                                                              safeSetState(() =>
                                                                  _model.choiceChipsValue =
                                                                      val?.firstOrNull);
                                                              _model.eventselect =
                                                                  _model
                                                                      .choiceChipsValue;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFFBBD1F4),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              iconSize: 14.0,
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              iconSize: 16.0,
                                                              labelPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            chipSpacing: 20.0,
                                                            rowSpacing: 8.0,
                                                            multiselect: false,
                                                            initialized: _model
                                                                    .choiceChipsValue !=
                                                                null,
                                                            alignment:
                                                                WrapAlignment
                                                                    .center,
                                                            controller: _model
                                                                    .choiceChipsValueController ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              ['مناسبات اليوم'],
                                                            ),
                                                            wrapped: true,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if ((_model.eventselect ==
                                                      'مناسبات اليوم') &&
                                                  (_model.eventselect != null &&
                                                      _model.eventselect != ''))
                                                Container(
                                                  width: 387.0,
                                                  height: 270.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFFFFFCF6),
                                                  ),
                                                  child: StreamBuilder<
                                                      List<EventsRecord>>(
                                                    stream: queryEventsRecord(
                                                      queryBuilder:
                                                          (eventsRecord) =>
                                                              eventsRecord
                                                                  .where(
                                                                    'FamilyName',
                                                                    isEqualTo:
                                                                        calenderPageUsersRecord
                                                                            .familyName,
                                                                  )
                                                                  .where(
                                                                    'Date',
                                                                    isGreaterThanOrEqualTo: _model
                                                                        .calendarSelectedDay
                                                                        ?.start,
                                                                  )
                                                                  .where(
                                                                    'Date',
                                                                    isLessThanOrEqualTo:
                                                                        _model
                                                                            .calendarSelectedDay
                                                                            ?.end,
                                                                  ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<EventsRecord>
                                                          listViewEventsRecordList =
                                                          snapshot.data!;
                                                      if (listViewEventsRecordList
                                                          .isEmpty) {
                                                        return const EmptyEventDayWidget();
                                                      }

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewEventsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewEventsRecord =
                                                              listViewEventsRecordList[
                                                                  listViewIndex];
                                                          return EventWidget(
                                                            key: Key(
                                                                'Keyggv_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                                            eventRef:
                                                                listViewEventsRecord
                                                                    .reference,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              if ((_model.eventselect ==
                                                      'القادمة') &&
                                                  (_model.eventselect != null &&
                                                      _model.eventselect != ''))
                                                Container(
                                                  width: 387.0,
                                                  height: 270.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFFFFFCF6),
                                                  ),
                                                  child: StreamBuilder<
                                                      List<EventsRecord>>(
                                                    stream: queryEventsRecord(
                                                      queryBuilder:
                                                          (eventsRecord) =>
                                                              eventsRecord
                                                                  .where(
                                                                    'FamilyName',
                                                                    isEqualTo:
                                                                        calenderPageUsersRecord
                                                                            .familyName,
                                                                  )
                                                                  .where(
                                                                    'Date',
                                                                    isGreaterThanOrEqualTo:
                                                                        getCurrentTimestamp,
                                                                  )
                                                                  .orderBy(
                                                                      'Date'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<EventsRecord>
                                                          listViewEventsRecordList =
                                                          snapshot.data!;
                                                      if (listViewEventsRecordList
                                                          .isEmpty) {
                                                        return const EmptyeventsWidget();
                                                      }

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewEventsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewEventsRecord =
                                                              listViewEventsRecordList[
                                                                  listViewIndex];
                                                          return EventWidget(
                                                            key: Key(
                                                                'Keyu6j_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                                            eventRef:
                                                                listViewEventsRecord
                                                                    .reference,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              if ((_model.eventselect ==
                                                      'مناسباتي') &&
                                                  (_model.eventselect != null &&
                                                      _model.eventselect != ''))
                                                Container(
                                                  width: 387.0,
                                                  height: 270.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFFFFFCF6),
                                                  ),
                                                  child: StreamBuilder<
                                                      List<EventsRecord>>(
                                                    stream: queryEventsRecord(
                                                      queryBuilder:
                                                          (eventsRecord) =>
                                                              eventsRecord
                                                                  .where(
                                                                    'FamilyName',
                                                                    isEqualTo:
                                                                        calenderPageUsersRecord
                                                                            .familyName,
                                                                  )
                                                                  .where(
                                                                    'CreatedBy',
                                                                    isEqualTo:
                                                                        calenderPageUsersRecord
                                                                            .reference,
                                                                  )
                                                                  .orderBy(
                                                                      'Date',
                                                                      descending:
                                                                          true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<EventsRecord>
                                                          listViewEventsRecordList =
                                                          snapshot.data!;
                                                      if (listViewEventsRecordList
                                                          .isEmpty) {
                                                        return const EmptymyeventWidget();
                                                      }

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewEventsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewEventsRecord =
                                                              listViewEventsRecordList[
                                                                  listViewIndex];
                                                          return EventWidget(
                                                            key: Key(
                                                                'Keye5t_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                                            eventRef:
                                                                listViewEventsRecord
                                                                    .reference,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              if ((_model.eventselect ==
                                                      'السابقة') &&
                                                  (_model.eventselect != null &&
                                                      _model.eventselect != ''))
                                                Container(
                                                  width: 387.0,
                                                  height: 270.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFFFFFCF6),
                                                  ),
                                                  child: StreamBuilder<
                                                      List<EventsRecord>>(
                                                    stream: queryEventsRecord(
                                                      queryBuilder:
                                                          (eventsRecord) =>
                                                              eventsRecord
                                                                  .where(
                                                                    'FamilyName',
                                                                    isEqualTo:
                                                                        calenderPageUsersRecord
                                                                            .familyName,
                                                                  )
                                                                  .where(
                                                                    'Date',
                                                                    isLessThan:
                                                                        getCurrentTimestamp,
                                                                  )
                                                                  .orderBy(
                                                                      'Date',
                                                                      descending:
                                                                          true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<EventsRecord>
                                                          listViewEventsRecordList =
                                                          snapshot.data!;
                                                      if (listViewEventsRecordList
                                                          .isEmpty) {
                                                        return const EmptyPreEventWidget();
                                                      }

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewEventsRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewEventsRecord =
                                                              listViewEventsRecordList[
                                                                  listViewIndex];
                                                          return EventWidget(
                                                            key: Key(
                                                                'Keyc5k_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                                            eventRef:
                                                                listViewEventsRecord
                                                                    .reference,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 17.0, 0.0, 10.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 25.0,
                                  borderWidth: 1.0,
                                  buttonSize: 56.0,
                                  fillColor: const Color(0xFF2A497D),
                                  icon: Icon(
                                    Icons.add_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 35.0,
                                  ),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: const CreateEventWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                        child: Stack(
                          children: [
                            wrapWithModel(
                              model: _model.navBar1Model,
                              updateCallback: () => safeSetState(() {}),
                              child: const NavBar1Widget(
                                currentpage: 'CalenderPage',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
