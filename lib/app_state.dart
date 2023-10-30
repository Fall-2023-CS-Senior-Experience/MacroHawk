import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _displayName =
          await secureStorage.getString('ff_displayName') ?? _displayName;
    });
    await _safeInitAsync(() async {
      _calorieGoal =
          await secureStorage.getInt('ff_calorieGoal') ?? _calorieGoal;
    });
    await _safeInitAsync(() async {
      _fatGoal = await secureStorage.getInt('ff_fatGoal') ?? _fatGoal;
    });
    await _safeInitAsync(() async {
      _carbGoal = await secureStorage.getInt('ff_carbGoal') ?? _carbGoal;
    });
    await _safeInitAsync(() async {
      _proteinGoal =
          await secureStorage.getInt('ff_proteinGoal') ?? _proteinGoal;
    });
    await _safeInitAsync(() async {
      _workoutDaysGoal =
          await secureStorage.getStringList('ff_workoutDaysGoal') ??
              _workoutDaysGoal;
    });
    await _safeInitAsync(() async {
      _dayCalories =
          await secureStorage.getInt('ff_dayCalories') ?? _dayCalories;
    });
    await _safeInitAsync(() async {
      _dayFat = await secureStorage.getInt('ff_dayFat') ?? _dayFat;
    });
    await _safeInitAsync(() async {
      _dayProtein = await secureStorage.getInt('ff_dayProtein') ?? _dayProtein;
    });
    await _safeInitAsync(() async {
      _dayCarbs = await secureStorage.getInt('ff_dayCarbs') ?? _dayCarbs;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

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

  String _displayName = '';
  String get displayName => _displayName;
  set displayName(String _value) {
    _displayName = _value;
    secureStorage.setString('ff_displayName', _value);
  }

  void deleteDisplayName() {
    secureStorage.delete(key: 'ff_displayName');
  }

  int _calorieGoal = 0;
  int get calorieGoal => _calorieGoal;
  set calorieGoal(int _value) {
    _calorieGoal = _value;
    secureStorage.setInt('ff_calorieGoal', _value);
  }

  void deleteCalorieGoal() {
    secureStorage.delete(key: 'ff_calorieGoal');
  }

  int _fatGoal = 0;
  int get fatGoal => _fatGoal;
  set fatGoal(int _value) {
    _fatGoal = _value;
    secureStorage.setInt('ff_fatGoal', _value);
  }

  void deleteFatGoal() {
    secureStorage.delete(key: 'ff_fatGoal');
  }

  int _carbGoal = 0;
  int get carbGoal => _carbGoal;
  set carbGoal(int _value) {
    _carbGoal = _value;
    secureStorage.setInt('ff_carbGoal', _value);
  }

  void deleteCarbGoal() {
    secureStorage.delete(key: 'ff_carbGoal');
  }

  int _proteinGoal = 0;
  int get proteinGoal => _proteinGoal;
  set proteinGoal(int _value) {
    _proteinGoal = _value;
    secureStorage.setInt('ff_proteinGoal', _value);
  }

  void deleteProteinGoal() {
    secureStorage.delete(key: 'ff_proteinGoal');
  }

  List<String> _workoutDaysGoal = [];
  List<String> get workoutDaysGoal => _workoutDaysGoal;
  set workoutDaysGoal(List<String> _value) {
    _workoutDaysGoal = _value;
    secureStorage.setStringList('ff_workoutDaysGoal', _value);
  }

  void deleteWorkoutDaysGoal() {
    secureStorage.delete(key: 'ff_workoutDaysGoal');
  }

  void addToWorkoutDaysGoal(String _value) {
    _workoutDaysGoal.add(_value);
    secureStorage.setStringList('ff_workoutDaysGoal', _workoutDaysGoal);
  }

  void removeFromWorkoutDaysGoal(String _value) {
    _workoutDaysGoal.remove(_value);
    secureStorage.setStringList('ff_workoutDaysGoal', _workoutDaysGoal);
  }

  void removeAtIndexFromWorkoutDaysGoal(int _index) {
    _workoutDaysGoal.removeAt(_index);
    secureStorage.setStringList('ff_workoutDaysGoal', _workoutDaysGoal);
  }

  void updateWorkoutDaysGoalAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _workoutDaysGoal[_index] = updateFn(_workoutDaysGoal[_index]);
    secureStorage.setStringList('ff_workoutDaysGoal', _workoutDaysGoal);
  }

  void insertAtIndexInWorkoutDaysGoal(int _index, String _value) {
    _workoutDaysGoal.insert(_index, _value);
    secureStorage.setStringList('ff_workoutDaysGoal', _workoutDaysGoal);
  }

  int _dayCalories = 0;
  int get dayCalories => _dayCalories;
  set dayCalories(int _value) {
    _dayCalories = _value;
    secureStorage.setInt('ff_dayCalories', _value);
  }

  void deleteDayCalories() {
    secureStorage.delete(key: 'ff_dayCalories');
  }

  int _dayFat = 0;
  int get dayFat => _dayFat;
  set dayFat(int _value) {
    _dayFat = _value;
    secureStorage.setInt('ff_dayFat', _value);
  }

  void deleteDayFat() {
    secureStorage.delete(key: 'ff_dayFat');
  }

  int _dayProtein = 0;
  int get dayProtein => _dayProtein;
  set dayProtein(int _value) {
    _dayProtein = _value;
    secureStorage.setInt('ff_dayProtein', _value);
  }

  void deleteDayProtein() {
    secureStorage.delete(key: 'ff_dayProtein');
  }

  int _dayCarbs = 0;
  int get dayCarbs => _dayCarbs;
  set dayCarbs(int _value) {
    _dayCarbs = _value;
    secureStorage.setInt('ff_dayCarbs', _value);
  }

  void deleteDayCarbs() {
    secureStorage.delete(key: 'ff_dayCarbs');
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
