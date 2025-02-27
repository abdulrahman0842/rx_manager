import 'package:flutter/material.dart';
import 'package:rx_manager/view/content_manager/content_form.dart';

class ContentManagerState with ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  final List<Widget> _contentManagerWidgets = [ContentForm()];
  List<Widget> get contentManagerWidget => _contentManagerWidgets;

  void selectWidget(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
