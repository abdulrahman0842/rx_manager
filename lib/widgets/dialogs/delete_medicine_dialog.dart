import 'package:flutter/material.dart';
import 'package:rx_manager/models/medicine.dart';
import 'package:rx_manager/services/inventory/medicine_service.dart';
import 'package:rx_manager/utils/utils.dart';

class DeleteMedicineDialog extends StatelessWidget {
  const DeleteMedicineDialog({
    super.key,
    required this.medicine,
  });
  final Medicine medicine;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete'),
      content: Text('Delete ${medicine.name}?'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        ElevatedButton(
            onPressed: () {
              MedicineService().deleteMedicine(medicine.id ?? '');
              Navigator.pop(context);
              Utils.flushBarSuccessMessage('Deleted Successfully', context);
            },
            child: Text('Delete'))
      ],
    );
  }
}
