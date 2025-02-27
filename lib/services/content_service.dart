import 'package:cloud_firestore/cloud_firestore.dart';

class ContentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addContent(String content) async {
    try {
      _firestore.collection('content').add({'content': content});
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
