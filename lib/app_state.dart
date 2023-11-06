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
    _safeInit(() {
      _dateStart = prefs.containsKey('ff_dateStart')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_dateStart')!)
          : _dateStart;
    });
    _safeInit(() {
      _dateEnd = prefs.containsKey('ff_dateEnd')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_dateEnd')!)
          : _dateEnd;
    });
    _safeInit(() {
      _dayS = prefs.containsKey('ff_dayS')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_dayS')!)
          : _dayS;
    });
    _safeInit(() {
      _dayE = prefs.containsKey('ff_dayE')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_dayE')!)
          : _dayE;
    });
    _safeInit(() {
      _weekS = prefs.containsKey('ff_weekS')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_weekS')!)
          : _weekS;
    });
    _safeInit(() {
      _weekE = prefs.containsKey('ff_weekE')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_weekE')!)
          : _weekE;
    });
    _safeInit(() {
      _monthS = prefs.containsKey('ff_monthS')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_monthS')!)
          : _monthS;
    });
    _safeInit(() {
      _monthE = prefs.containsKey('ff_monthE')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_monthE')!)
          : _monthE;
    });
    _safeInit(() {
      _snacklist = prefs
              .getStringList('ff_snacklist')
              ?.map((path) => path.ref)
              .toList() ??
          _snacklist;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _tab = 'tab';
  String get tab => _tab;
  set tab(String _value) {
    _tab = _value;
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

  DateTime? _dateStart = DateTime.fromMillisecondsSinceEpoch(1699233600000);
  DateTime? get dateStart => _dateStart;
  set dateStart(DateTime? _value) {
    _dateStart = _value;
    _value != null
        ? prefs.setInt('ff_dateStart', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_dateStart');
  }

  DateTime? _dateEnd = DateTime.fromMillisecondsSinceEpoch(1699233600000);
  DateTime? get dateEnd => _dateEnd;
  set dateEnd(DateTime? _value) {
    _dateEnd = _value;
    _value != null
        ? prefs.setInt('ff_dateEnd', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_dateEnd');
  }

  DateTime? _dayS = DateTime.fromMillisecondsSinceEpoch(1699233540000);
  DateTime? get dayS => _dayS;
  set dayS(DateTime? _value) {
    _dayS = _value;
    _value != null
        ? prefs.setInt('ff_dayS', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_dayS');
  }

  DateTime? _dayE = DateTime.fromMillisecondsSinceEpoch(1699233540000);
  DateTime? get dayE => _dayE;
  set dayE(DateTime? _value) {
    _dayE = _value;
    _value != null
        ? prefs.setInt('ff_dayE', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_dayE');
  }

  DateTime? _weekS = DateTime.fromMillisecondsSinceEpoch(1699233540000);
  DateTime? get weekS => _weekS;
  set weekS(DateTime? _value) {
    _weekS = _value;
    _value != null
        ? prefs.setInt('ff_weekS', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_weekS');
  }

  DateTime? _weekE = DateTime.fromMillisecondsSinceEpoch(1699233540000);
  DateTime? get weekE => _weekE;
  set weekE(DateTime? _value) {
    _weekE = _value;
    _value != null
        ? prefs.setInt('ff_weekE', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_weekE');
  }

  DateTime? _monthS = DateTime.fromMillisecondsSinceEpoch(1699233600000);
  DateTime? get monthS => _monthS;
  set monthS(DateTime? _value) {
    _monthS = _value;
    _value != null
        ? prefs.setInt('ff_monthS', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_monthS');
  }

  DateTime? _monthE = DateTime.fromMillisecondsSinceEpoch(1699233600000);
  DateTime? get monthE => _monthE;
  set monthE(DateTime? _value) {
    _monthE = _value;
    _value != null
        ? prefs.setInt('ff_monthE', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_monthE');
  }

  List<DocumentReference> _snacklist = [];
  List<DocumentReference> get snacklist => _snacklist;
  set snacklist(List<DocumentReference> _value) {
    _snacklist = _value;
    prefs.setStringList('ff_snacklist', _value.map((x) => x.path).toList());
  }

  void addToSnacklist(DocumentReference _value) {
    _snacklist.add(_value);
    prefs.setStringList('ff_snacklist', _snacklist.map((x) => x.path).toList());
  }

  void removeFromSnacklist(DocumentReference _value) {
    _snacklist.remove(_value);
    prefs.setStringList('ff_snacklist', _snacklist.map((x) => x.path).toList());
  }

  void removeAtIndexFromSnacklist(int _index) {
    _snacklist.removeAt(_index);
    prefs.setStringList('ff_snacklist', _snacklist.map((x) => x.path).toList());
  }

  void updateSnacklistAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _snacklist[_index] = updateFn(_snacklist[_index]);
    prefs.setStringList('ff_snacklist', _snacklist.map((x) => x.path).toList());
  }

  void insertAtIndexInSnacklist(int _index, DocumentReference _value) {
    _snacklist.insert(_index, _value);
    prefs.setStringList('ff_snacklist', _snacklist.map((x) => x.path).toList());
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
