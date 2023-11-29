import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersNamesRecord extends FirestoreRecord {
  UsersNamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_names');

  static Stream<UsersNamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersNamesRecord.fromSnapshot(s));

  static Future<UsersNamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersNamesRecord.fromSnapshot(s));

  static UsersNamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersNamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersNamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersNamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersNamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersNamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersNamesRecordData({
  String? username,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersNamesRecordDocumentEquality implements Equality<UsersNamesRecord> {
  const UsersNamesRecordDocumentEquality();

  @override
  bool equals(UsersNamesRecord? e1, UsersNamesRecord? e2) {
    return e1?.username == e2?.username;
  }

  @override
  int hash(UsersNamesRecord? e) => const ListEquality().hash([e?.username]);

  @override
  bool isValidKey(Object? o) => o is UsersNamesRecord;
}
