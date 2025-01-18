import 'package:flutter/material.dart';
import 'package:rx_manager/models/medicine.dart';
import 'package:rx_manager/widgets/medicine_form.dart';

class UpdateMedicineDialog extends StatelessWidget {
  const UpdateMedicineDialog({
    super.key,
    required this.medicine,
  });
  final Medicine medicine;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: MedicineForm(
          isEditing: true,
          medicine: medicine,
        ),
      ),
    );
  }
}
