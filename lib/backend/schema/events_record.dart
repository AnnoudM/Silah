import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "EventID" field.
  String? _eventID;
  String get eventID => _eventID ?? '';
  bool hasEventID() => _eventID != null;

  // "FamilyName" field.
  DocumentReference? _familyName;
  DocumentReference? get familyName => _familyName;
  bool hasFamilyName() => _familyName != null;

  // "EventDes" field.
  String? _eventDes;
  String get eventDes => _eventDes ?? '';
  bool hasEventDes() => _eventDes != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "CreatedBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "PublisherName" field.
  String? _publisherName;
  String get publisherName => _publisherName ?? '';
  bool hasPublisherName() => _publisherName != null;

  // "Time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _location = snapshotData['Location'] as String?;
    _eventID = snapshotData['EventID'] as String?;
    _familyName = snapshotData['FamilyName'] as DocumentReference?;
    _eventDes = snapshotData['EventDes'] as String?;
    _date = snapshotData['Date'] as DateTime?;
    _createdBy = snapshotData['CreatedBy'] as DocumentReference?;
    _publisherName = snapshotData['PublisherName'] as String?;
    _time = snapshotData['Time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? name,
  String? location,
  String? eventID,
  DocumentReference? familyName,
  String? eventDes,
  DateTime? date,
  DocumentReference? createdBy,
  String? publisherName,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Location': location,
      'EventID': eventID,
      'FamilyName': familyName,
      'EventDes': eventDes,
      'Date': date,
      'CreatedBy': createdBy,
      'PublisherName': publisherName,
      'Time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.eventID == e2?.eventID &&
        e1?.familyName == e2?.familyName &&
        e1?.eventDes == e2?.eventDes &&
        e1?.date == e2?.date &&
        e1?.createdBy == e2?.createdBy &&
        e1?.publisherName == e2?.publisherName &&
        e1?.time == e2?.time;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.eventID,
        e?.familyName,
        e?.eventDes,
        e?.date,
        e?.createdBy,
        e?.publisherName,
        e?.time
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
