import 'package:flutter/material.dart';
import 'package:rx_manager/utils/utils.dart';
import 'package:rx_manager/widgets/action_buttons.dart';
import 'package:rx_manager/widgets/custom_text_form_field.dart';
import 'package:rx_manager/models/medicine.dart';
import 'package:rx_manager/services/inventory/medicine_service.dart';

class MedicineForm extends StatefulWidget {
  final bool isEditing;
  final Medicine? medicine;

  const MedicineForm({super.key, required this.isEditing, this.medicine});

  @override
  State<MedicineForm> createState() => _MedicineFormState();
}

class _MedicineFormState extends State<MedicineForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  final FocusNode nameNode = FocusNode();
  final FocusNode companyNode = FocusNode();
  final FocusNode contentNode = FocusNode();
  final FocusNode storageNode = FocusNode();
  final FocusNode stockNode = FocusNode();
  final FocusNode submitButtonNode = FocusNode();

  void _initializeFields() {
    _nameController.text = widget.medicine?.name ?? 'Null';
    _companyController.text = widget.medicine?.company ?? 'NUll';
    _contentController.text = widget.medicine?.content ?? 'NUll';
    _storageController.text = widget.medicine?.storage ?? 'NUll';
    _stockController.text = widget.medicine?.stock ?? 'NUll';
  }

  void _clearFields() {
    // Clear the text fields
    _nameController.clear();
    _companyController.clear();
    _contentController.clear();
    _storageController.clear();
    _stockController.clear();
  }

  Future<void> _submitMedicine() async {
    try {
      final medicine = Medicine(
        id: widget.isEditing ? widget.medicine?.id : null,
        name: _nameController.text,
        company: _companyController.text,
        content: _contentController.text,
        storage: _storageController.text,
        stock: _stockController.text,
      );

      widget.isEditing
          ? await MedicineService().updateMedicine(medicine)
          : await MedicineService().addMedicine(medicine);

      // Clear Fields
      _clearFields();

      //Navigate to the previous screen
      if (widget.isEditing) {
        Navigator.pop(context);
      }

      // Success Message
      /* The error you're encountering, Assertion failed: !_debugLocked is not true, typically occurs when you try to perform a navigation operation (like popping a dialog) while another navigation operation is still in progress. This can happen if you try to close a dialog and show a success message at the same time.

      To resolve this issue, you can ensure that the navigation operation (like popping the dialog) completes before showing the success message. You can use Future.delayed to add a slight delay before showing the success message.
      */
      // await Future.delayed(Duration(milliseconds: 300), () {
      Utils.flushBarSuccessMessage(
          widget.isEditing ? 'Successfully Updated' : 'Successfully Added',
          context);
      // });
    } catch (e) {
      // await Future.delayed(Duration(milliseconds: 300), () {
      Utils.showFlushBarErrorMessage(e.toString(), context);
      // });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      _initializeFields();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row: Name and Company
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Enter Name',
                  controller: _nameController,
                  currentNode: nameNode,
                  nextNode: companyNode,
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                    hintText: 'Enter Company',
                    controller: _companyController,
                    currentNode: companyNode,
                    nextNode: contentNode),
              ),
            ],
          ),

          // Second Row: Content and Storage
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Enter Content',
                  controller: _contentController,
                  currentNode: contentNode,
                  nextNode: storageNode,
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Enter Storage',
                  controller: _storageController,
                  currentNode: storageNode,
                  nextNode: stockNode,
                ),
              ),
            ],
          ),

          // Third Row: Stock (Full-width)
          CustomTextFormField(
            hintText: 'Enter Stock',
            controller: _stockController,
            currentNode: stockNode,
            nextNode: null,
          ),

          // Action Buttons

          ActionButtons(
            elevatedButtonLabel: 'Save',
            textButtonLabel: widget.isEditing ? 'Cancel' : 'Clear All',
            textButtonOnTap: () {
              widget.isEditing ? Navigator.pop(context) : _clearFields();
            },
            elevatedButtonOnTap: () {
              _submitMedicine();
            },
          ),
        ],
      ),
    ));
  }
}
