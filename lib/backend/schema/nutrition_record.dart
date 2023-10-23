import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutritionRecord extends FirestoreRecord {
  NutritionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "calories" field.
  String? _calories;
  String get calories => _calories ?? '';
  bool hasCalories() => _calories != null;

  // "carbs" field.
  String? _carbs;
  String get carbs => _carbs ?? '';
  bool hasCarbs() => _carbs != null;

  // "proteins" field.
  String? _proteins;
  String get proteins => _proteins ?? '';
  bool hasProteins() => _proteins != null;

  // "fats" field.
  String? _fats;
  String get fats => _fats ?? '';
  bool hasFats() => _fats != null;

  // "current_time" field.
  DateTime? _currentTime;
  DateTime? get currentTime => _currentTime;
  bool hasCurrentTime() => _currentTime != null;

  // "mealtime" field.
  String? _mealtime;
  String get mealtime => _mealtime ?? '';
  bool hasMealtime() => _mealtime != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _name = snapshotData['name'] as String?;
    _calories = snapshotData['calories'] as String?;
    _carbs = snapshotData['carbs'] as String?;
    _proteins = snapshotData['proteins'] as String?;
    _fats = snapshotData['fats'] as String?;
    _currentTime = snapshotData['current_time'] as DateTime?;
    _mealtime = snapshotData['mealtime'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nutrition');

  static Stream<NutritionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NutritionRecord.fromSnapshot(s));

  static Future<NutritionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NutritionRecord.fromSnapshot(s));

  static NutritionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NutritionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NutritionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NutritionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NutritionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NutritionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNutritionRecordData({
  String? image,
  String? name,
  String? calories,
  String? carbs,
  String? proteins,
  String? fats,
  DateTime? currentTime,
  String? mealtime,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'name': name,
      'calories': calories,
      'carbs': carbs,
      'proteins': proteins,
      'fats': fats,
      'current_time': currentTime,
      'mealtime': mealtime,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class NutritionRecordDocumentEquality implements Equality<NutritionRecord> {
  const NutritionRecordDocumentEquality();

  @override
  bool equals(NutritionRecord? e1, NutritionRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.name == e2?.name &&
        e1?.calories == e2?.calories &&
        e1?.carbs == e2?.carbs &&
        e1?.proteins == e2?.proteins &&
        e1?.fats == e2?.fats &&
        e1?.currentTime == e2?.currentTime &&
        e1?.mealtime == e2?.mealtime &&
        e1?.date == e2?.date;
  }

  @override
  int hash(NutritionRecord? e) => const ListEquality().hash([
        e?.image,
        e?.name,
        e?.calories,
        e?.carbs,
        e?.proteins,
        e?.fats,
        e?.currentTime,
        e?.mealtime,
        e?.date
      ]);

  @override
  bool isValidKey(Object? o) => o is NutritionRecord;
}
