import 'package:flutter/material.dart';
import 'package:rx_manager/components/custom_text_form_field.dart';
import 'package:rx_manager/models/medicine.dart';
import 'package:rx_manager/services/inventory/medicine_service.dart';

class UpdateMedicineForm extends StatelessWidget {
  UpdateMedicineForm({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Medicine')),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 15,
          children: [
            CustomTextFormField(
                hintText: 'Enter Name', controller: _nameController),
            CustomTextFormField(
                hintText: 'Enter Company', controller: _companyController),
            CustomTextFormField(
                hintText: 'Enter Content', controller: _contentController),
            CustomTextFormField(
                hintText: 'Enter Storage', controller: _storageController),
            CustomTextFormField(
                hintText: 'Enter Stock', controller: _stockController),

            // Add a button to submit the form
            GestureDetector(
                onTap: () async {
                  // Add the logic to save the medicine to the database
                  try {
                    MedicineService().updateMedicine(Medicine(
                        _nameController.text,
                        _companyController.text,
                        _contentController.text,
                        _storageController.text,
                        _stockController.text));
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(e.toString()),
                          );
                        });
                  }
                  // Clear the text fields
                  _nameController.clear();
                  _companyController.clear();
                  _contentController.clear();
                  _storageController.clear();
                  _stockController.clear();

                  // Show a dialog to indicate that the medicine has been added
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         content: Text('Medicine added successfully'),
                  //       );
                  //     });

                  // Navigate back to the home screen
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.teal.shade800),
                  child: Text(
                    'Add Medicine',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
