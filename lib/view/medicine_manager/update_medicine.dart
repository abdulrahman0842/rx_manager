import 'package:flutter/material.dart';
import 'package:rx_manager/models/medicine.dart';
import 'package:rx_manager/services/inventory/medicine_service.dart';
import 'package:rx_manager/utils/theme.dart';
import 'package:rx_manager/widgets/medicine_form.dart';

class UpdateMedicine extends StatefulWidget {
  const UpdateMedicine({super.key});

  @override
  State<UpdateMedicine> createState() => _UpdateMedicineState();
}

class _UpdateMedicineState extends State<UpdateMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Medcine')),
      body: StreamBuilder(
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
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  Medicine medicine = snapshot.data![index];
                  return Card(
                    color: secondaryColor,
                    child: ListTile(
                      title: Text(medicine.name),
                      subtitle: Text(medicine.content),
                      trailing: Text(medicine.storage),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Update'),
                                content: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: MedicineForm(
                                    isEditing: true,
                                    medicine: medicine,
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  );
                });
          }),
    );
  }
}
