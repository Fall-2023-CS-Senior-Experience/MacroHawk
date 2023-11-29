import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
    _safeInit(() {
      _randomUserInt = prefs.getInt('ff_randomUserInt') ?? _randomUserInt;
    });
    _safeInit(() {
      _username = prefs.getString('ff_username') ?? _username;
    });
    _safeInit(() {
      _userIdRef = prefs.getString('ff_userIdRef')?.ref ?? _userIdRef;
    });
    _safeInit(() {
      _kalDay = prefs.getDouble('ff_kalDay') ?? _kalDay;
    });
    _safeInit(() {
      _fatD = prefs.getDouble('ff_fatD') ?? _fatD;
    });
    _safeInit(() {
      _carbD = prefs.getDouble('ff_carbD') ?? _carbD;
    });
    _safeInit(() {
      _proteinD = prefs.getDouble('ff_proteinD') ?? _proteinD;
    });
    _safeInit(() {
      _kcalW = prefs.getDouble('ff_kcalW') ?? _kcalW;
    });
    _safeInit(() {
      _fatW = prefs.getDouble('ff_fatW') ?? _fatW;
    });
    _safeInit(() {
      _proteinW = prefs.getDouble('ff_proteinW') ?? _proteinW;
    });
    _safeInit(() {
      _carbW = prefs.getDouble('ff_carbW') ?? _carbW;
    });
    _safeInit(() {
      _kalM = prefs.getDouble('ff_kalM') ?? _kalM;
    });
    _safeInit(() {
      _proteinM = prefs.getDouble('ff_proteinM') ?? _proteinM;
    });
    _safeInit(() {
      _fatM = prefs.getDouble('ff_fatM') ?? _fatM;
    });
    _safeInit(() {
      _carbM = prefs.getDouble('ff_carbM') ?? _carbM;
    });
    _safeInit(() {
      _kalmacros =
          prefs.getStringList('ff_kalmacros')?.map(double.parse).toList() ??
              _kalmacros;
    });
    _safeInit(() {
      _carbsProgressBar = prefs
              .getStringList('ff_carbsProgressBar')
              ?.map(double.parse)
              .toList() ??
          _carbsProgressBar;
    });
    _safeInit(() {
      _proteinProgressBar = prefs
              .getStringList('ff_proteinProgressBar')
              ?.map(double.parse)
              .toList() ??
          _proteinProgressBar;
    });
    _safeInit(() {
      _fatProgressBar = prefs
              .getStringList('ff_fatProgressBar')
              ?.map(double.parse)
              .toList() ??
          _fatProgressBar;
    });
    _safeInit(() {
      _offsetKal =
          prefs.getStringList('ff_offsetKal')?.map(double.parse).toList() ??
              _offsetKal;
    });
    _safeInit(() {
      _offsetProtein =
          prefs.getStringList('ff_offsetProtein')?.map(double.parse).toList() ??
              _offsetProtein;
    });
    _safeInit(() {
      _offsetFat =
          prefs.getStringList('ff_offsetFat')?.map(double.parse).toList() ??
              _offsetFat;
    });
    _safeInit(() {
      _offsetCarbs =
          prefs.getStringList('ff_offsetCarbs')?.map(double.parse).toList() ??
              _offsetCarbs;
    });
    _safeInit(() {
      _offLineSave = prefs
              .getStringList('ff_offLineSave')
              ?.map((x) {
                try {
                  return OfflineSaveStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _offLineSave;
    });
    _safeInit(() {
      _isConnected = prefs.getBool('ff_isConnected') ?? _isConnected;
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

  int _randomUserInt = 0;
  int get randomUserInt => _randomUserInt;
  set randomUserInt(int _value) {
    _randomUserInt = _value;
    prefs.setInt('ff_randomUserInt', _value);
  }

  String _username = 'null_name';
  String get username => _username;
  set username(String _value) {
    _username = _value;
    prefs.setString('ff_username', _value);
  }

  DocumentReference? _userIdRef;
  DocumentReference? get userIdRef => _userIdRef;
  set userIdRef(DocumentReference? _value) {
    _userIdRef = _value;
    _value != null
        ? prefs.setString('ff_userIdRef', _value.path)
        : prefs.remove('ff_userIdRef');
  }

  double _kalDay = 0;
  double get kalDay => _kalDay;
  set kalDay(double _value) {
    _kalDay = _value;
    prefs.setDouble('ff_kalDay', _value);
  }

  double _fatD = 0;
  double get fatD => _fatD;
  set fatD(double _value) {
    _fatD = _value;
    prefs.setDouble('ff_fatD', _value);
  }

  double _carbD = 0;
  double get carbD => _carbD;
  set carbD(double _value) {
    _carbD = _value;
    prefs.setDouble('ff_carbD', _value);
  }

  double _proteinD = 0;
  double get proteinD => _proteinD;
  set proteinD(double _value) {
    _proteinD = _value;
    prefs.setDouble('ff_proteinD', _value);
  }

  double _kcalW = 0.0;
  double get kcalW => _kcalW;
  set kcalW(double _value) {
    _kcalW = _value;
    prefs.setDouble('ff_kcalW', _value);
  }

  double _fatW = 0.0;
  double get fatW => _fatW;
  set fatW(double _value) {
    _fatW = _value;
    prefs.setDouble('ff_fatW', _value);
  }

  double _proteinW = 0.0;
  double get proteinW => _proteinW;
  set proteinW(double _value) {
    _proteinW = _value;
    prefs.setDouble('ff_proteinW', _value);
  }

  double _carbW = 0.0;
  double get carbW => _carbW;
  set carbW(double _value) {
    _carbW = _value;
    prefs.setDouble('ff_carbW', _value);
  }

  double _kalM = 0.0;
  double get kalM => _kalM;
  set kalM(double _value) {
    _kalM = _value;
    prefs.setDouble('ff_kalM', _value);
  }

  double _proteinM = 0.0;
  double get proteinM => _proteinM;
  set proteinM(double _value) {
    _proteinM = _value;
    prefs.setDouble('ff_proteinM', _value);
  }

  double _fatM = 0.0;
  double get fatM => _fatM;
  set fatM(double _value) {
    _fatM = _value;
    prefs.setDouble('ff_fatM', _value);
  }

  double _carbM = 0.0;
  double get carbM => _carbM;
  set carbM(double _value) {
    _carbM = _value;
    prefs.setDouble('ff_carbM', _value);
  }

  List<double> _kalmacros = [0, 0, 0];
  List<double> get kalmacros => _kalmacros;
  set kalmacros(List<double> _value) {
    _kalmacros = _value;
    prefs.setStringList(
        'ff_kalmacros', _value.map((x) => x.toString()).toList());
  }

  void addToKalmacros(double _value) {
    _kalmacros.add(_value);
    prefs.setStringList(
        'ff_kalmacros', _kalmacros.map((x) => x.toString()).toList());
  }

  void removeFromKalmacros(double _value) {
    _kalmacros.remove(_value);
    prefs.setStringList(
        'ff_kalmacros', _kalmacros.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromKalmacros(int _index) {
    _kalmacros.removeAt(_index);
    prefs.setStringList(
        'ff_kalmacros', _kalmacros.map((x) => x.toString()).toList());
  }

  void updateKalmacrosAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _kalmacros[_index] = updateFn(_kalmacros[_index]);
    prefs.setStringList(
        'ff_kalmacros', _kalmacros.map((x) => x.toString()).toList());
  }

  void insertAtIndexInKalmacros(int _index, double _value) {
    _kalmacros.insert(_index, _value);
    prefs.setStringList(
        'ff_kalmacros', _kalmacros.map((x) => x.toString()).toList());
  }

  List<double> _carbsProgressBar = [0, 0, 0];
  List<double> get carbsProgressBar => _carbsProgressBar;
  set carbsProgressBar(List<double> _value) {
    _carbsProgressBar = _value;
    prefs.setStringList(
        'ff_carbsProgressBar', _value.map((x) => x.toString()).toList());
  }

  void addToCarbsProgressBar(double _value) {
    _carbsProgressBar.add(_value);
    prefs.setStringList('ff_carbsProgressBar',
        _carbsProgressBar.map((x) => x.toString()).toList());
  }

  void removeFromCarbsProgressBar(double _value) {
    _carbsProgressBar.remove(_value);
    prefs.setStringList('ff_carbsProgressBar',
        _carbsProgressBar.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCarbsProgressBar(int _index) {
    _carbsProgressBar.removeAt(_index);
    prefs.setStringList('ff_carbsProgressBar',
        _carbsProgressBar.map((x) => x.toString()).toList());
  }

  void updateCarbsProgressBarAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _carbsProgressBar[_index] = updateFn(_carbsProgressBar[_index]);
    prefs.setStringList('ff_carbsProgressBar',
        _carbsProgressBar.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCarbsProgressBar(int _index, double _value) {
    _carbsProgressBar.insert(_index, _value);
    prefs.setStringList('ff_carbsProgressBar',
        _carbsProgressBar.map((x) => x.toString()).toList());
  }

  List<double> _proteinProgressBar = [0, 0, 0];
  List<double> get proteinProgressBar => _proteinProgressBar;
  set proteinProgressBar(List<double> _value) {
    _proteinProgressBar = _value;
    prefs.setStringList(
        'ff_proteinProgressBar', _value.map((x) => x.toString()).toList());
  }

  void addToProteinProgressBar(double _value) {
    _proteinProgressBar.add(_value);
    prefs.setStringList('ff_proteinProgressBar',
        _proteinProgressBar.map((x) => x.toString()).toList());
  }

  void removeFromProteinProgressBar(double _value) {
    _proteinProgressBar.remove(_value);
    prefs.setStringList('ff_proteinProgressBar',
        _proteinProgressBar.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromProteinProgressBar(int _index) {
    _proteinProgressBar.removeAt(_index);
    prefs.setStringList('ff_proteinProgressBar',
        _proteinProgressBar.map((x) => x.toString()).toList());
  }

  void updateProteinProgressBarAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _proteinProgressBar[_index] = updateFn(_proteinProgressBar[_index]);
    prefs.setStringList('ff_proteinProgressBar',
        _proteinProgressBar.map((x) => x.toString()).toList());
  }

  void insertAtIndexInProteinProgressBar(int _index, double _value) {
    _proteinProgressBar.insert(_index, _value);
    prefs.setStringList('ff_proteinProgressBar',
        _proteinProgressBar.map((x) => x.toString()).toList());
  }

  List<double> _fatProgressBar = [0, 0, 0];
  List<double> get fatProgressBar => _fatProgressBar;
  set fatProgressBar(List<double> _value) {
    _fatProgressBar = _value;
    prefs.setStringList(
        'ff_fatProgressBar', _value.map((x) => x.toString()).toList());
  }

  void addToFatProgressBar(double _value) {
    _fatProgressBar.add(_value);
    prefs.setStringList(
        'ff_fatProgressBar', _fatProgressBar.map((x) => x.toString()).toList());
  }

  void removeFromFatProgressBar(double _value) {
    _fatProgressBar.remove(_value);
    prefs.setStringList(
        'ff_fatProgressBar', _fatProgressBar.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromFatProgressBar(int _index) {
    _fatProgressBar.removeAt(_index);
    prefs.setStringList(
        'ff_fatProgressBar', _fatProgressBar.map((x) => x.toString()).toList());
  }

  void updateFatProgressBarAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _fatProgressBar[_index] = updateFn(_fatProgressBar[_index]);
    prefs.setStringList(
        'ff_fatProgressBar', _fatProgressBar.map((x) => x.toString()).toList());
  }

  void insertAtIndexInFatProgressBar(int _index, double _value) {
    _fatProgressBar.insert(_index, _value);
    prefs.setStringList(
        'ff_fatProgressBar', _fatProgressBar.map((x) => x.toString()).toList());
  }

  List<double> _offsetKal = [0, 0, 0];
  List<double> get offsetKal => _offsetKal;
  set offsetKal(List<double> _value) {
    _offsetKal = _value;
    prefs.setStringList(
        'ff_offsetKal', _value.map((x) => x.toString()).toList());
  }

  void addToOffsetKal(double _value) {
    _offsetKal.add(_value);
    prefs.setStringList(
        'ff_offsetKal', _offsetKal.map((x) => x.toString()).toList());
  }

  void removeFromOffsetKal(double _value) {
    _offsetKal.remove(_value);
    prefs.setStringList(
        'ff_offsetKal', _offsetKal.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromOffsetKal(int _index) {
    _offsetKal.removeAt(_index);
    prefs.setStringList(
        'ff_offsetKal', _offsetKal.map((x) => x.toString()).toList());
  }

  void updateOffsetKalAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _offsetKal[_index] = updateFn(_offsetKal[_index]);
    prefs.setStringList(
        'ff_offsetKal', _offsetKal.map((x) => x.toString()).toList());
  }

  void insertAtIndexInOffsetKal(int _index, double _value) {
    _offsetKal.insert(_index, _value);
    prefs.setStringList(
        'ff_offsetKal', _offsetKal.map((x) => x.toString()).toList());
  }

  List<double> _offsetProtein = [0, 0, 0];
  List<double> get offsetProtein => _offsetProtein;
  set offsetProtein(List<double> _value) {
    _offsetProtein = _value;
    prefs.setStringList(
        'ff_offsetProtein', _value.map((x) => x.toString()).toList());
  }

  void addToOffsetProtein(double _value) {
    _offsetProtein.add(_value);
    prefs.setStringList(
        'ff_offsetProtein', _offsetProtein.map((x) => x.toString()).toList());
  }

  void removeFromOffsetProtein(double _value) {
    _offsetProtein.remove(_value);
    prefs.setStringList(
        'ff_offsetProtein', _offsetProtein.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromOffsetProtein(int _index) {
    _offsetProtein.removeAt(_index);
    prefs.setStringList(
        'ff_offsetProtein', _offsetProtein.map((x) => x.toString()).toList());
  }

  void updateOffsetProteinAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _offsetProtein[_index] = updateFn(_offsetProtein[_index]);
    prefs.setStringList(
        'ff_offsetProtein', _offsetProtein.map((x) => x.toString()).toList());
  }

  void insertAtIndexInOffsetProtein(int _index, double _value) {
    _offsetProtein.insert(_index, _value);
    prefs.setStringList(
        'ff_offsetProtein', _offsetProtein.map((x) => x.toString()).toList());
  }

  List<double> _offsetFat = [0, 0, 0];
  List<double> get offsetFat => _offsetFat;
  set offsetFat(List<double> _value) {
    _offsetFat = _value;
    prefs.setStringList(
        'ff_offsetFat', _value.map((x) => x.toString()).toList());
  }

  void addToOffsetFat(double _value) {
    _offsetFat.add(_value);
    prefs.setStringList(
        'ff_offsetFat', _offsetFat.map((x) => x.toString()).toList());
  }

  void removeFromOffsetFat(double _value) {
    _offsetFat.remove(_value);
    prefs.setStringList(
        'ff_offsetFat', _offsetFat.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromOffsetFat(int _index) {
    _offsetFat.removeAt(_index);
    prefs.setStringList(
        'ff_offsetFat', _offsetFat.map((x) => x.toString()).toList());
  }

  void updateOffsetFatAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _offsetFat[_index] = updateFn(_offsetFat[_index]);
    prefs.setStringList(
        'ff_offsetFat', _offsetFat.map((x) => x.toString()).toList());
  }

  void insertAtIndexInOffsetFat(int _index, double _value) {
    _offsetFat.insert(_index, _value);
    prefs.setStringList(
        'ff_offsetFat', _offsetFat.map((x) => x.toString()).toList());
  }

  List<double> _offsetCarbs = [0, 0, 0];
  List<double> get offsetCarbs => _offsetCarbs;
  set offsetCarbs(List<double> _value) {
    _offsetCarbs = _value;
    prefs.setStringList(
        'ff_offsetCarbs', _value.map((x) => x.toString()).toList());
  }

  void addToOffsetCarbs(double _value) {
    _offsetCarbs.add(_value);
    prefs.setStringList(
        'ff_offsetCarbs', _offsetCarbs.map((x) => x.toString()).toList());
  }

  void removeFromOffsetCarbs(double _value) {
    _offsetCarbs.remove(_value);
    prefs.setStringList(
        'ff_offsetCarbs', _offsetCarbs.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromOffsetCarbs(int _index) {
    _offsetCarbs.removeAt(_index);
    prefs.setStringList(
        'ff_offsetCarbs', _offsetCarbs.map((x) => x.toString()).toList());
  }

  void updateOffsetCarbsAtIndex(
    int _index,
    double Function(double) updateFn,
  ) {
    _offsetCarbs[_index] = updateFn(_offsetCarbs[_index]);
    prefs.setStringList(
        'ff_offsetCarbs', _offsetCarbs.map((x) => x.toString()).toList());
  }

  void insertAtIndexInOffsetCarbs(int _index, double _value) {
    _offsetCarbs.insert(_index, _value);
    prefs.setStringList(
        'ff_offsetCarbs', _offsetCarbs.map((x) => x.toString()).toList());
  }

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int _value) {
    _tabIndex = _value;
  }

  int _nullListCheck = 0;
  int get nullListCheck => _nullListCheck;
  set nullListCheck(int _value) {
    _nullListCheck = _value;
  }

  String _nullListTrue = 'null';
  String get nullListTrue => _nullListTrue;
  set nullListTrue(String _value) {
    _nullListTrue = _value;
  }

  List<OfflineSaveStruct> _offLineSave = [];
  List<OfflineSaveStruct> get offLineSave => _offLineSave;
  set offLineSave(List<OfflineSaveStruct> _value) {
    _offLineSave = _value;
    prefs.setStringList(
        'ff_offLineSave', _value.map((x) => x.serialize()).toList());
  }

  void addToOffLineSave(OfflineSaveStruct _value) {
    _offLineSave.add(_value);
    prefs.setStringList(
        'ff_offLineSave', _offLineSave.map((x) => x.serialize()).toList());
  }

  void removeFromOffLineSave(OfflineSaveStruct _value) {
    _offLineSave.remove(_value);
    prefs.setStringList(
        'ff_offLineSave', _offLineSave.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromOffLineSave(int _index) {
    _offLineSave.removeAt(_index);
    prefs.setStringList(
        'ff_offLineSave', _offLineSave.map((x) => x.serialize()).toList());
  }

  void updateOffLineSaveAtIndex(
    int _index,
    OfflineSaveStruct Function(OfflineSaveStruct) updateFn,
  ) {
    _offLineSave[_index] = updateFn(_offLineSave[_index]);
    prefs.setStringList(
        'ff_offLineSave', _offLineSave.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInOffLineSave(int _index, OfflineSaveStruct _value) {
    _offLineSave.insert(_index, _value);
    prefs.setStringList(
        'ff_offLineSave', _offLineSave.map((x) => x.serialize()).toList());
  }

  bool _isConnected = true;
  bool get isConnected => _isConnected;
  set isConnected(bool _value) {
    _isConnected = _value;
    prefs.setBool('ff_isConnected', _value);
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
