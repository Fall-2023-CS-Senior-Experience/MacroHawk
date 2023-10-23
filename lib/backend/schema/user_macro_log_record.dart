import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserMacroLogRecord extends FirestoreRecord {
  UserMacroLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dateAdded" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  bool hasDateAdded() => _dateAdded != null;

  // "nutritionRef" field.
  DocumentReference? _nutritionRef;
  DocumentReference? get nutritionRef => _nutritionRef;
  bool hasNutritionRef() => _nutritionRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dateAdded = snapshotData['dateAdded'] as DateTime?;
    _nutritionRef = snapshotData['nutritionRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userMacroLog')
          : FirebaseFirestore.instance.collectionGroup('userMacroLog');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('userMacroLog').doc();

  static Stream<UserMacroLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserMacroLogRecord.fromSnapshot(s));

  static Future<UserMacroLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserMacroLogRecord.fromSnapshot(s));

  static UserMacroLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserMacroLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserMacroLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserMacroLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserMacroLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserMacroLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserMacroLogRecordData({
  DateTime? dateAdded,
  DocumentReference? nutritionRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dateAdded': dateAdded,
      'nutritionRef': nutritionRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserMacroLogRecordDocumentEquality
    implements Equality<UserMacroLogRecord> {
  const UserMacroLogRecordDocumentEquality();

  @override
  bool equals(UserMacroLogRecord? e1, UserMacroLogRecord? e2) {
    return e1?.dateAdded == e2?.dateAdded &&
        e1?.nutritionRef == e2?.nutritionRef;
  }

  @override
  int hash(UserMacroLogRecord? e) =>
      const ListEquality().hash([e?.dateAdded, e?.nutritionRef]);

  @override
  bool isValidKey(Object? o) => o is UserMacroLogRecord;
}
