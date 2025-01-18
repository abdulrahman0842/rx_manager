// import 'package:flutter/material.dart';
// import 'package:rx_manager/models/medicine.dart';

// class ViewMedicineDialog extends StatelessWidget {
//   const ViewMedicineDialog({
//     super.key,
//     required this.medicine,
//   });
//   final Medicine medicine;
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(medicine.name),
//       content: Text(medicine.content),
//       actions: [
//         TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Cancel')),
//         ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Okay'))
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:rx_manager/models/medicine.dart';

class ViewMedicineDialog extends StatelessWidget {
  const ViewMedicineDialog({
    super.key,
    required this.medicine,
  });

  final Medicine medicine;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Center(
        child: Text(
          medicine.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow('Company', medicine.company),
          _buildDetailRow('Content', medicine.content),
          _buildDetailRow('Storage', medicine.storage),
          _buildDetailRow('Stock', medicine.stock),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Okay'),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
