import 'package:flutter/material.dart';

class HoverState extends ChangeNotifier {
  final List<bool> _hoverState = List<bool>.filled(7, false);
  List<bool> get hoverState => _hoverState;

  void setHover(int index, bool value) {
    _hoverState[index] = value;
    notifyListeners();
  }
}
