import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> create({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    final docRef = _firestore.collection(collectionPath).doc(documentId);
    await docRef.set(data);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> read({
    required String collectionPath,
    required String documentId,
  }) async {
    final docRef = _firestore.collection(collectionPath).doc(documentId);
    final snapshot = await docRef.get();
    return snapshot.exists ? snapshot : null;
  }

  Future<void> update({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    final docRef = _firestore.collection(collectionPath).doc(documentId);
    await docRef.update(data);
  }

  Future<void> delete({
    required String collectionPath,
    required String documentId,
  }) async {
    final docRef = _firestore.collection(collectionPath).doc(documentId);
    await docRef.delete();
  }
}
