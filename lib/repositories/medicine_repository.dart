import 'package:rx_manager/models/medicine.dart';

abstract class MedicineRepository {
  Stream<List<Medicine>> getMedicines();
}
