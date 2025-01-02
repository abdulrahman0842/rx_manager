import 'package:flutter/material.dart';
import 'package:rx_manager/widgets/custom_text_form_field.dart';
import 'package:rx_manager/models/medicine.dart';
import 'package:rx_manager/services/inventory/medicine_service.dart';

class MedicineForm extends StatefulWidget {
  final bool isEditing;
  Medicine? medicine;

  MedicineForm({super.key, required this.isEditing, this.medicine});

  @override
  State<MedicineForm> createState() => _MedicineFormState();
}

class _MedicineFormState extends State<MedicineForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      _nameController.text = widget.medicine?.name ?? 'Null';
      _companyController.text = widget.medicine?.company ?? 'NUll';
      _contentController.text = widget.medicine?.content ?? 'NUll';
      _storageController.text = widget.medicine?.storage ?? 'NUll';
      _stockController.text = widget.medicine?.stock ?? 'NUll';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.isEditing ? 'Edit Medicine' : 'Add Medicine')),
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
                    if (widget.isEditing) {
                      MedicineService().updateMedicine(
                          Medicine(
                              _nameController.text,
                              _companyController.text,
                              _contentController.text,
                              _storageController.text,
                              _stockController.text),
                          widget.medicine?.id ?? '');
                    } else {
                      MedicineService().addMedicine(Medicine(
                          _nameController.text,
                          _companyController.text,
                          _contentController.text,
                          _storageController.text,
                          _stockController.text));
                    }
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
                  // _nameController.clear();
                  // _companyController.clear();
                  // _contentController.clear();
                  // _storageController.clear();
                  // _stockController.clear();

                  // Show a dialog to indicate that the medicine has been added
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         content: Text('Medicine added successfully'),
                  //       );
                  //     });

                  // Navigate back to the home screen
                  // Navigator.pop(context);
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
