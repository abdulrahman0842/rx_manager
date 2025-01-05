import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rx_manager/models/medicine.dart';

class MedicineService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // addMedicine method
  Future<void> addMedicine(Medicine medicine) async {
    try {
      await _firestore.collection('medicines').add({
        'name': medicine.name,
        'company': medicine.company,
        'content': medicine.content,
        'storage': medicine.storage,
        'stock': medicine.stock
      });

      log('Successfully added medicine');
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  // getMedicines method
  Stream<List<Medicine>> getMedicines() {
    return _firestore
        .collection('medicines')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              var data = doc.data();
              return Medicine(
                  id: doc.id,
                  name: data['name'],
                  company: data['company'],
                  content: data['content'],
                  storage: data['storage'],
                  stock: data['stock']);
            }).toList());
  }

  // updateMedicine method
  Future<void> updateMedicine(Medicine medicine) async {
    try {
      _firestore.collection('medicines').doc(medicine.id).update({
        'name': medicine.name,
        'company': medicine.company,
        'content': medicine.content,
        'storage': medicine.storage,
        'stock': medicine.stock
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  // deleteMedicine method
  Future<void> deleteMedicine(String id) async {
    try {
      await _firestore.collection('medicines').doc(id).delete();
    } catch (e) {
      throw Exception(e);
    }
  }
}
