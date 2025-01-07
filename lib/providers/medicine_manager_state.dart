import 'package:flutter/material.dart';
import 'package:rx_manager/view/medicine_manager/update_medicine.dart';
import 'package:rx_manager/widgets/medicine_form.dart';

class MedicineManagerState extends ChangeNotifier {
  int _selectedPage = 0;
  int get selectedPage => _selectedPage;

  final List<Widget> _medicineManagerWidgets = [
    MedicineForm(isEditing: false),
    UpdateMedicine(),
    Center(
      child: Text('Delete Medicine'),
    )
  ];
  List<Widget> get medicineManagerWidgets => _medicineManagerWidgets;

  void selectWidget(int index) {
    _selectedPage = index;
    notifyListeners();
  }
}
