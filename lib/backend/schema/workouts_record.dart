import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutsRecord extends FirestoreRecord {
  WorkoutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  bool hasReps() => _reps != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "completedDays" field.
  List<String>? _completedDays;
  List<String> get completedDays => _completedDays ?? const [];
  bool hasCompletedDays() => _completedDays != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "plannedDays" field.
  List<String>? _plannedDays;
  List<String> get plannedDays => _plannedDays ?? const [];
  bool hasPlannedDays() => _plannedDays != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _desc = snapshotData['desc'] as String?;
    _reps = castToType<int>(snapshotData['reps']);
    _weight = castToType<int>(snapshotData['weight']);
    _category = snapshotData['category'] as String?;
    _completedDays = getDataList(snapshotData['completedDays']);
    _displayName = snapshotData['displayName'] as String?;
    _plannedDays = getDataList(snapshotData['plannedDays']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workouts');

  static Stream<WorkoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutsRecord.fromSnapshot(s));

  static Future<WorkoutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutsRecord.fromSnapshot(s));

  static WorkoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutsRecordData({
  String? name,
  String? desc,
  int? reps,
  int? weight,
  String? category,
  String? displayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'desc': desc,
      'reps': reps,
      'weight': weight,
      'category': category,
      'displayName': displayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkoutsRecordDocumentEquality implements Equality<WorkoutsRecord> {
  const WorkoutsRecordDocumentEquality();

  @override
  bool equals(WorkoutsRecord? e1, WorkoutsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.desc == e2?.desc &&
        e1?.reps == e2?.reps &&
        e1?.weight == e2?.weight &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.completedDays, e2?.completedDays) &&
        e1?.displayName == e2?.displayName &&
        listEquality.equals(e1?.plannedDays, e2?.plannedDays);
  }

  @override
  int hash(WorkoutsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.desc,
        e?.reps,
        e?.weight,
        e?.category,
        e?.completedDays,
        e?.displayName,
        e?.plannedDays
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkoutsRecord;
}
