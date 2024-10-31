import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/sprint1/side_admin_copy/side_admin_copy_widget.dart';
import '/sprint2/create_event/create_event_widget.dart';
import '/sprint2/empty_event_day/empty_event_day_widget.dart';
import '/sprint2/empty_pre_event/empty_pre_event_widget.dart';
import '/sprint2/emptyevents/emptyevents_widget.dart';
import '/sprint2/emptymyevent/emptymyevent_widget.dart';
import '/sprint2/event/event_widget.dart';
import 'dart:math';
import 'calender_page_widget.dart' show CalenderPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalenderPageModel extends FlutterFlowModel<CalenderPageWidget> {
  ///  Local state fields for this page.

  bool searchactive = false;

  DateTime? dateSelected;

  DateTime? foucusDay;

  List<EventsRecord> importedEvents = [];
  void addToImportedEvents(EventsRecord item) => importedEvents.add(item);
  void removeFromImportedEvents(EventsRecord item) =>
      importedEvents.remove(item);
  void removeAtIndexFromImportedEvents(int index) =>
      importedEvents.removeAt(index);
  void insertAtIndexInImportedEvents(int index, EventsRecord item) =>
      importedEvents.insert(index, item);
  void updateImportedEventsAtIndex(
          int index, Function(EventsRecord) updateFn) =>
      importedEvents[index] = updateFn(importedEvents[index]);

  String? eventselect = '';

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;
  // Model for sideAdminCopy component.
  late SideAdminCopyModel sideAdminCopyModel;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    navBar1Model = createModel(context, () => NavBar1Model());
    sideAdminCopyModel = createModel(context, () => SideAdminCopyModel());
  }

  @override
  void dispose() {
    navBar1Model.dispose();
    sideAdminCopyModel.dispose();
  }
}
