import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/homes/nav_bar1/nav_bar1_widget.dart';
import '/homes/side_bar/side_bar_widget.dart';
import 'calender_page_widget.dart' show CalenderPageWidget;
import 'package:flutter/material.dart';

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
  // Model for sideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    navBar1Model = createModel(context, () => NavBar1Model());
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    navBar1Model.dispose();
    sideBarModel.dispose();
  }
}
