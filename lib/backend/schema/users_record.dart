import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "proteinGoal" field.
  double? _proteinGoal;
  double get proteinGoal => _proteinGoal ?? 0.0;
  bool hasProteinGoal() => _proteinGoal != null;

  // "calorieGoal" field.
  double? _calorieGoal;
  double get calorieGoal => _calorieGoal ?? 0.0;
  bool hasCalorieGoal() => _calorieGoal != null;

  // "fatGoal" field.
  double? _fatGoal;
  double get fatGoal => _fatGoal ?? 0.0;
  bool hasFatGoal() => _fatGoal != null;

  // "carbGoal" field.
  double? _carbGoal;
  double get carbGoal => _carbGoal ?? 0.0;
  bool hasCarbGoal() => _carbGoal != null;

  // "workoutDayGoal" field.
  int? _workoutDayGoal;
  int get workoutDayGoal => _workoutDayGoal ?? 0;
  bool hasWorkoutDayGoal() => _workoutDayGoal != null;

  // "workoutTimeGoal" field.
  int? _workoutTimeGoal;
  int get workoutTimeGoal => _workoutTimeGoal ?? 0;
  bool hasWorkoutTimeGoal() => _workoutTimeGoal != null;

  // "likedWorkouts" field.
  List<DocumentReference>? _likedWorkouts;
  List<DocumentReference> get likedWorkouts => _likedWorkouts ?? const [];
  bool hasLikedWorkouts() => _likedWorkouts != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "workoutDaysGoal" field.
  List<String>? _workoutDaysGoal;
  List<String> get workoutDaysGoal => _workoutDaysGoal ?? const [];
  bool hasWorkoutDaysGoal() => _workoutDaysGoal != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _proteinGoal = castToType<double>(snapshotData['proteinGoal']);
    _calorieGoal = castToType<double>(snapshotData['calorieGoal']);
    _fatGoal = castToType<double>(snapshotData['fatGoal']);
    _carbGoal = castToType<double>(snapshotData['carbGoal']);
    _workoutDayGoal = castToType<int>(snapshotData['workoutDayGoal']);
    _workoutTimeGoal = castToType<int>(snapshotData['workoutTimeGoal']);
    _likedWorkouts = getDataList(snapshotData['likedWorkouts']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _workoutDaysGoal = getDataList(snapshotData['workoutDaysGoal']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  double? proteinGoal,
  double? calorieGoal,
  double? fatGoal,
  double? carbGoal,
  int? workoutDayGoal,
  int? workoutTimeGoal,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'proteinGoal': proteinGoal,
      'calorieGoal': calorieGoal,
      'fatGoal': fatGoal,
      'carbGoal': carbGoal,
      'workoutDayGoal': workoutDayGoal,
      'workoutTimeGoal': workoutTimeGoal,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.proteinGoal == e2?.proteinGoal &&
        e1?.calorieGoal == e2?.calorieGoal &&
        e1?.fatGoal == e2?.fatGoal &&
        e1?.carbGoal == e2?.carbGoal &&
        e1?.workoutDayGoal == e2?.workoutDayGoal &&
        e1?.workoutTimeGoal == e2?.workoutTimeGoal &&
        listEquality.equals(e1?.likedWorkouts, e2?.likedWorkouts) &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.workoutDaysGoal, e2?.workoutDaysGoal);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.proteinGoal,
        e?.calorieGoal,
        e?.fatGoal,
        e?.carbGoal,
        e?.workoutDayGoal,
        e?.workoutTimeGoal,
        e?.likedWorkouts,
        e?.phoneNumber,
        e?.workoutDaysGoal
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
