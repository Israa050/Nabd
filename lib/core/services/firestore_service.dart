import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_demo/core/services/firebase/firebase_result.dart';
import 'package:crypto_demo/core/services/firebase/firebase_error_handler.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FirebaseResult<void>> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    try {
      final reference = _firestore.doc(path);
      await reference.set(data, SetOptions(merge: merge));
      return  FirebaseResult.success(null);
    } catch (e) {
      return FirebaseResult.failure(FirebaseErrorHandler.handle(e));
    }
  }

  Future<FirebaseResult<DocumentSnapshot<Map<String, dynamic>>>> getDocument({
    required String path,
  }) async {
    try {
      final reference = _firestore.doc(path);
      final snapshot = await reference.get();
      return FirebaseResult.success(snapshot);
    } catch (e) {
      return FirebaseResult.failure(FirebaseErrorHandler.handle(e));
    }
  }

  CollectionReference<Map<String, dynamic>> collection(String path) {
    return _firestore.collection(path);
  }
}
