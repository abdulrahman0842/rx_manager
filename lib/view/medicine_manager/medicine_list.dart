import 'package:flutter/material.dart';
import 'package:rx_manager/models/medicine.dart';
import 'package:rx_manager/services/inventory/medicine_service.dart';
import 'package:rx_manager/widgets/dialogs/delete_medicine_dialog.dart';
import 'package:rx_manager/widgets/dialogs/update_medicine_dialog.dart';
import 'package:rx_manager/widgets/dialogs/view_medicine_dialog.dart';
import 'package:rx_manager/widgets/medicine_card_widget.dart';

class MedicineList extends StatefulWidget {
  const MedicineList(
      {super.key,
      this.isEditing = false,
      this.isDeleting = false,
      this.isViewing = false});
  final bool isEditing;
  final bool isDeleting;
  final bool isViewing;

  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  deleteDialog(Medicine medicine) {
    showDialog(
        context: context,
        builder: (context) {
          return DeleteMedicineDialog(
            medicine: medicine,
          );
        });
  }

  updateDialog(Medicine medicine) {
    showDialog(
        context: context,
        builder: (context) {
          return UpdateMedicineDialog(
            medicine: medicine,
          );
        });
  }

  viewDialog(Medicine medicine) {
    showDialog(
        context: context,
        builder: (context) {
          return ViewMedicineDialog(
            medicine: medicine,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 16,
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          StreamBuilder(
              stream: MedicineService().getMedicines(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Unable to Load Medicines'),
                  );
                }
                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Center(child: Text('No Medicines Available'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      Medicine medicine = snapshot.data![index];
                      return MedicineCardWidget(
                          medicine: medicine,
                          onTap: () {
                            if (widget.isDeleting) {
                              deleteDialog(medicine);
                            }
                            if (widget.isEditing) {
                              updateDialog(medicine);
                            }
                            if (widget.isViewing) {
                              viewDialog(medicine);
                            }
                          });
                    });
              }),
        ],
      ),
    );
  }
}
