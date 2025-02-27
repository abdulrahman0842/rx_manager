import 'package:flutter/material.dart';
import 'package:rx_manager/view/content_manager/add_content.dart';

class ContentManagerState with ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  final List<Widget> _contentManagerWidgets = [AddContent()];
  List<Widget> get contentManagerWidget => _contentManagerWidgets;

  void selectWidget(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
