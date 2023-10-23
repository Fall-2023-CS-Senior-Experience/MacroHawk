import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DateTime? _dateStart = DateTime.fromMillisecondsSinceEpoch(1697775480000);
  DateTime? get dateStart => _dateStart;
  set dateStart(DateTime? _value) {
    _dateStart = _value;
  }

  DateTime? _dateEnd = DateTime.fromMillisecondsSinceEpoch(1697775480000);
  DateTime? get dateEnd => _dateEnd;
  set dateEnd(DateTime? _value) {
    _dateEnd = _value;
  }

  String _tab = 'tab';
  String get tab => _tab;
  set tab(String _value) {
    _tab = _value;
  }

  DateTime? _dayS = DateTime.fromMillisecondsSinceEpoch(1697781060000);
  DateTime? get dayS => _dayS;
  set dayS(DateTime? _value) {
    _dayS = _value;
  }

  DateTime? _dayE = DateTime.fromMillisecondsSinceEpoch(1697781060000);
  DateTime? get dayE => _dayE;
  set dayE(DateTime? _value) {
    _dayE = _value;
  }

  DateTime? _weekS = DateTime.fromMillisecondsSinceEpoch(1697781180000);
  DateTime? get weekS => _weekS;
  set weekS(DateTime? _value) {
    _weekS = _value;
  }

  DateTime? _weekE = DateTime.fromMillisecondsSinceEpoch(1697781180000);
  DateTime? get weekE => _weekE;
  set weekE(DateTime? _value) {
    _weekE = _value;
  }

  DateTime? _monthS = DateTime.fromMillisecondsSinceEpoch(1697781180000);
  DateTime? get monthS => _monthS;
  set monthS(DateTime? _value) {
    _monthS = _value;
  }

  DateTime? _monthE = DateTime.fromMillisecondsSinceEpoch(1697781180000);
  DateTime? get monthE => _monthE;
  set monthE(DateTime? _value) {
    _monthE = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
