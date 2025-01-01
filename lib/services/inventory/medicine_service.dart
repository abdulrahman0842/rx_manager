import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rx_manager/models/medicine.dart';

class MedicineService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // addMedicine method
  Future<void> addMedicine(Medicine medicine) async {
    try {
      await _firestore.collection('medicines').doc(medicine.name).set({
        'name': medicine.name,
        'company': medicine.company,
        'content': medicine.content,
        'storage': medicine.storage,
        'stock': medicine.stock,
      });

      log('Successfully added medicine');
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  // getMedicines method
  Stream<List> getMedicines() {
    return _firestore
        .collection('medicines')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  // updateMedicine method
  Future<void> updateMedicine(Medicine medicine) async {
    try {
      _firestore.collection('medicines').doc(medicine.name).update({
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
}
