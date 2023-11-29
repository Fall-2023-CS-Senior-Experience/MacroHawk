// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OfflineSaveStruct extends FFFirebaseStruct {
  OfflineSaveStruct({
    String? calories,
    String? fats,
    String? protein,
    String? carbs,
    String? mealtime,
    DateTime? date,
    String? measure,
    String? quanity,
    String? name,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _calories = calories,
        _fats = fats,
        _protein = protein,
        _carbs = carbs,
        _mealtime = mealtime,
        _date = date,
        _measure = measure,
        _quanity = quanity,
        _name = name,
        _image = image,
        super(firestoreUtilData);

  // "calories" field.
  String? _calories;
  String get calories => _calories ?? '';
  set calories(String? val) => _calories = val;
  bool hasCalories() => _calories != null;

  // "fats" field.
  String? _fats;
  String get fats => _fats ?? '';
  set fats(String? val) => _fats = val;
  bool hasFats() => _fats != null;

  // "protein" field.
  String? _protein;
  String get protein => _protein ?? '';
  set protein(String? val) => _protein = val;
  bool hasProtein() => _protein != null;

  // "carbs" field.
  String? _carbs;
  String get carbs => _carbs ?? '';
  set carbs(String? val) => _carbs = val;
  bool hasCarbs() => _carbs != null;

  // "mealtime" field.
  String? _mealtime;
  String get mealtime => _mealtime ?? '';
  set mealtime(String? val) => _mealtime = val;
  bool hasMealtime() => _mealtime != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "measure" field.
  String? _measure;
  String get measure => _measure ?? '';
  set measure(String? val) => _measure = val;
  bool hasMeasure() => _measure != null;

  // "quanity" field.
  String? _quanity;
  String get quanity => _quanity ?? '';
  set quanity(String? val) => _quanity = val;
  bool hasQuanity() => _quanity != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  static OfflineSaveStruct fromMap(Map<String, dynamic> data) =>
      OfflineSaveStruct(
        calories: data['calories'] as String?,
        fats: data['fats'] as String?,
        protein: data['protein'] as String?,
        carbs: data['carbs'] as String?,
        mealtime: data['mealtime'] as String?,
        date: data['date'] as DateTime?,
        measure: data['measure'] as String?,
        quanity: data['quanity'] as String?,
        name: data['name'] as String?,
        image: data['image'] as String?,
      );

  static OfflineSaveStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OfflineSaveStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'calories': _calories,
        'fats': _fats,
        'protein': _protein,
        'carbs': _carbs,
        'mealtime': _mealtime,
        'date': _date,
        'measure': _measure,
        'quanity': _quanity,
        'name': _name,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'calories': serializeParam(
          _calories,
          ParamType.String,
        ),
        'fats': serializeParam(
          _fats,
          ParamType.String,
        ),
        'protein': serializeParam(
          _protein,
          ParamType.String,
        ),
        'carbs': serializeParam(
          _carbs,
          ParamType.String,
        ),
        'mealtime': serializeParam(
          _mealtime,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'measure': serializeParam(
          _measure,
          ParamType.String,
        ),
        'quanity': serializeParam(
          _quanity,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static OfflineSaveStruct fromSerializableMap(Map<String, dynamic> data) =>
      OfflineSaveStruct(
        calories: deserializeParam(
          data['calories'],
          ParamType.String,
          false,
        ),
        fats: deserializeParam(
          data['fats'],
          ParamType.String,
          false,
        ),
        protein: deserializeParam(
          data['protein'],
          ParamType.String,
          false,
        ),
        carbs: deserializeParam(
          data['carbs'],
          ParamType.String,
          false,
        ),
        mealtime: deserializeParam(
          data['mealtime'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        measure: deserializeParam(
          data['measure'],
          ParamType.String,
          false,
        ),
        quanity: deserializeParam(
          data['quanity'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OfflineSaveStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OfflineSaveStruct &&
        calories == other.calories &&
        fats == other.fats &&
        protein == other.protein &&
        carbs == other.carbs &&
        mealtime == other.mealtime &&
        date == other.date &&
        measure == other.measure &&
        quanity == other.quanity &&
        name == other.name &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([
        calories,
        fats,
        protein,
        carbs,
        mealtime,
        date,
        measure,
        quanity,
        name,
        image
      ]);
}

OfflineSaveStruct createOfflineSaveStruct({
  String? calories,
  String? fats,
  String? protein,
  String? carbs,
  String? mealtime,
  DateTime? date,
  String? measure,
  String? quanity,
  String? name,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OfflineSaveStruct(
      calories: calories,
      fats: fats,
      protein: protein,
      carbs: carbs,
      mealtime: mealtime,
      date: date,
      measure: measure,
      quanity: quanity,
      name: name,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OfflineSaveStruct? updateOfflineSaveStruct(
  OfflineSaveStruct? offlineSave, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    offlineSave
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOfflineSaveStructData(
  Map<String, dynamic> firestoreData,
  OfflineSaveStruct? offlineSave,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (offlineSave == null) {
    return;
  }
  if (offlineSave.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && offlineSave.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final offlineSaveData =
      getOfflineSaveFirestoreData(offlineSave, forFieldValue);
  final nestedData =
      offlineSaveData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = offlineSave.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOfflineSaveFirestoreData(
  OfflineSaveStruct? offlineSave, [
  bool forFieldValue = false,
]) {
  if (offlineSave == null) {
    return {};
  }
  final firestoreData = mapToFirestore(offlineSave.toMap());

  // Add any Firestore field values
  offlineSave.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOfflineSaveListFirestoreData(
  List<OfflineSaveStruct>? offlineSaves,
) =>
    offlineSaves?.map((e) => getOfflineSaveFirestoreData(e, true)).toList() ??
    [];
