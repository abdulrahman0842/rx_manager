import 'package:rx_manager/models/medicine.dart';
import 'package:rx_manager/repositories/medicine_repository.dart';
import 'package:rx_manager/services/inventory/medicine_service.dart';

class ServerMedicineRepository implements MedicineRepository {
  @override
  Stream<List<Medicine>> getMedicines() {
    try {
      return MedicineService().getMedicines();
    } catch (e) {
      throw Exception(e);
    }
  }
}
