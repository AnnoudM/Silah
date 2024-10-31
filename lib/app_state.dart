import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _DarkMode = prefs.getBool('ff_DarkMode') ?? _DarkMode;
    });
    _safeInit(() {
      _FamilyName = prefs.getString('ff_FamilyName')?.ref ?? _FamilyName;
    });
    _safeInit(() {
      _Multi1 = prefs.getString('ff_Multi1')?.ref ?? _Multi1;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _DarkMode = false;
  bool get DarkMode => _DarkMode;
  set DarkMode(bool value) {
    _DarkMode = value;
    prefs.setBool('ff_DarkMode', value);
  }

  DocumentReference? _FamilyName;
  DocumentReference? get FamilyName => _FamilyName;
  set FamilyName(DocumentReference? value) {
    _FamilyName = value;
    value != null
        ? prefs.setString('ff_FamilyName', value.path)
        : prefs.remove('ff_FamilyName');
  }

  String _currentPage = '';
  String get currentPage => _currentPage;
  set currentPage(String value) {
    _currentPage = value;
  }

  DocumentReference? _Multi1 =
      FirebaseFirestore.instance.doc('/Family/BrYQMfkAkamLIaTN2fJv');
  DocumentReference? get Multi1 => _Multi1;
  set Multi1(DocumentReference? value) {
    _Multi1 = value;
    value != null
        ? prefs.setString('ff_Multi1', value.path)
        : prefs.remove('ff_Multi1');
  }

  List<DocumentReference> _notifyy = [
    FirebaseFirestore.instance.doc('/userrr/KFnW7SIUAWdYaH7qsJy7R4uaxJg1')
  ];
  List<DocumentReference> get notifyy => _notifyy;
  set notifyy(List<DocumentReference> value) {
    _notifyy = value;
  }

  void addToNotifyy(DocumentReference value) {
    notifyy.add(value);
  }

  void removeFromNotifyy(DocumentReference value) {
    notifyy.remove(value);
  }

  void removeAtIndexFromNotifyy(int index) {
    notifyy.removeAt(index);
  }

  void updateNotifyyAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    notifyy[index] = updateFn(_notifyy[index]);
  }

  void insertAtIndexInNotifyy(int index, DocumentReference value) {
    notifyy.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
