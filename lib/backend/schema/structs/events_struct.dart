// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EventsStruct extends FFFirebaseStruct {
  EventsStruct({
    String? name,
    String? location,
    String? date,
    String? eventID,
    DocumentReference? familyID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _location = location,
        _date = date,
        _eventID = eventID,
        _familyID = familyID,
        super(firestoreUtilData);

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "Date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "EventID" field.
  String? _eventID;
  String get eventID => _eventID ?? '';
  set eventID(String? val) => _eventID = val;

  bool hasEventID() => _eventID != null;

  // "FamilyID" field.
  DocumentReference? _familyID;
  DocumentReference? get familyID => _familyID;
  set familyID(DocumentReference? val) => _familyID = val;

  bool hasFamilyID() => _familyID != null;

  static EventsStruct fromMap(Map<String, dynamic> data) => EventsStruct(
        name: data['Name'] as String?,
        location: data['Location'] as String?,
        date: data['Date'] as String?,
        eventID: data['EventID'] as String?,
        familyID: data['FamilyID'] as DocumentReference?,
      );

  static EventsStruct? maybeFromMap(dynamic data) =>
      data is Map ? EventsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Location': _location,
        'Date': _date,
        'EventID': _eventID,
        'FamilyID': _familyID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Location': serializeParam(
          _location,
          ParamType.String,
        ),
        'Date': serializeParam(
          _date,
          ParamType.String,
        ),
        'EventID': serializeParam(
          _eventID,
          ParamType.String,
        ),
        'FamilyID': serializeParam(
          _familyID,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static EventsStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventsStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['Date'],
          ParamType.String,
          false,
        ),
        eventID: deserializeParam(
          data['EventID'],
          ParamType.String,
          false,
        ),
        familyID: deserializeParam(
          data['FamilyID'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Family'],
        ),
      );

  @override
  String toString() => 'EventsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventsStruct &&
        name == other.name &&
        location == other.location &&
        date == other.date &&
        eventID == other.eventID &&
        familyID == other.familyID;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, location, date, eventID, familyID]);
}

EventsStruct createEventsStruct({
  String? name,
  String? location,
  String? date,
  String? eventID,
  DocumentReference? familyID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventsStruct(
      name: name,
      location: location,
      date: date,
      eventID: eventID,
      familyID: familyID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventsStruct? updateEventsStruct(
  EventsStruct? events, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    events
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventsStructData(
  Map<String, dynamic> firestoreData,
  EventsStruct? events,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (events == null) {
    return;
  }
  if (events.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && events.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventsData = getEventsFirestoreData(events, forFieldValue);
  final nestedData = eventsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = events.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventsFirestoreData(
  EventsStruct? events, [
  bool forFieldValue = false,
]) {
  if (events == null) {
    return {};
  }
  final firestoreData = mapToFirestore(events.toMap());

  // Add any Firestore field values
  events.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventsListFirestoreData(
  List<EventsStruct>? eventss,
) =>
    eventss?.map((e) => getEventsFirestoreData(e, true)).toList() ?? [];
