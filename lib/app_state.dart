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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _displayName = prefs.getString('ff_displayName') ?? _displayName;
    });
    _safeInit(() {
      _calorieGoal = prefs.getInt('ff_calorieGoal') ?? _calorieGoal;
    });
    _safeInit(() {
      _fatGoal = prefs.getInt('ff_fatGoal') ?? _fatGoal;
    });
    _safeInit(() {
      _carbGoal = prefs.getInt('ff_carbGoal') ?? _carbGoal;
    });
    _safeInit(() {
      _proteinGoal = prefs.getInt('ff_proteinGoal') ?? _proteinGoal;
    });
    _safeInit(() {
      _workoutDaysGoal =
          prefs.getStringList('ff_workoutDaysGoal') ?? _workoutDaysGoal;
    });
    _safeInit(() {
      _dayCalories = prefs.getInt('ff_dayCalories') ?? _dayCalories;
    });
    _safeInit(() {
      _dayFat = prefs.getInt('ff_dayFat') ?? _dayFat;
    });
    _safeInit(() {
      _dayProtein = prefs.getInt('ff_dayProtein') ?? _dayProtein;
    });
    _safeInit(() {
      _dayCarbs = prefs.getInt('ff_dayCarbs') ?? _dayCarbs;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  String _tabindexMacros = 'type';
  String get tabindexMacros => _tabindexMacros;
  set tabindexMacros(String _value) {
    _tabindexMacros = _value;
  }

  String _displayName = 'User';
  String get displayName => _displayName;
  set displayName(String _value) {
    _displayName = _value;
    prefs.setString('ff_displayName', _value);
  }

  int _calorieGoal = 0;
  int get calorieGoal => _calorieGoal;
  set calorieGoal(int _value) {
    _calorieGoal = _value;
    prefs.setInt('ff_calorieGoal', _value);
  }

  int _fatGoal = 0;
  int get fatGoal => _fatGoal;
  set fatGoal(int _value) {
    _fatGoal = _value;
    prefs.setInt('ff_fatGoal', _value);
  }

  int _carbGoal = 0;
  int get carbGoal => _carbGoal;
  set carbGoal(int _value) {
    _carbGoal = _value;
    prefs.setInt('ff_carbGoal', _value);
  }

  int _proteinGoal = 0;
  int get proteinGoal => _proteinGoal;
  set proteinGoal(int _value) {
    _proteinGoal = _value;
    prefs.setInt('ff_proteinGoal', _value);
  }

  List<String> _workoutDaysGoal = [];
  List<String> get workoutDaysGoal => _workoutDaysGoal;
  set workoutDaysGoal(List<String> _value) {
    _workoutDaysGoal = _value;
    prefs.setStringList('ff_workoutDaysGoal', _value);
  }

  void addToWorkoutDaysGoal(String _value) {
    _workoutDaysGoal.add(_value);
    prefs.setStringList('ff_workoutDaysGoal', _workoutDaysGoal);
  }

  void removeFromWorkoutDaysGoal(String _value) {
    _workoutDaysGoal.remove(_value);
    prefs.setStringList('ff_workoutDaysGoal', _workoutDaysGoal);
  }

  void removeAtIndexFromWorkoutDaysGoal(int _index) {
    _workoutDaysGoal.removeAt(_index);
    prefs.setStringList('ff_workoutDaysGoal', _workoutDaysGoal);
  }

  void updateWorkoutDaysGoalAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _workoutDaysGoal[_index] = updateFn(_workoutDaysGoal[_index]);
    prefs.setStringList('ff_workoutDaysGoal', _workoutDaysGoal);
  }

  void insertAtIndexInWorkoutDaysGoal(int _index, String _value) {
    _workoutDaysGoal.insert(_index, _value);
    prefs.setStringList('ff_workoutDaysGoal', _workoutDaysGoal);
  }

  int _dayCalories = 0;
  int get dayCalories => _dayCalories;
  set dayCalories(int _value) {
    _dayCalories = _value;
    prefs.setInt('ff_dayCalories', _value);
  }

  int _dayFat = 0;
  int get dayFat => _dayFat;
  set dayFat(int _value) {
    _dayFat = _value;
    prefs.setInt('ff_dayFat', _value);
  }

  int _dayProtein = 0;
  int get dayProtein => _dayProtein;
  set dayProtein(int _value) {
    _dayProtein = _value;
    prefs.setInt('ff_dayProtein', _value);
  }

  int _dayCarbs = 0;
  int get dayCarbs => _dayCarbs;
  set dayCarbs(int _value) {
    _dayCarbs = _value;
    prefs.setInt('ff_dayCarbs', _value);
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
