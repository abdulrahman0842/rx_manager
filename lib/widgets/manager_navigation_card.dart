import 'package:flutter/material.dart';
import 'package:rx_manager/utils/theme.dart';

class ManagerNavigationCard extends StatelessWidget {
  const ManagerNavigationCard(
      {super.key, required this.onTap, required this.label});

  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      child: ListTile(
        focusColor: Colors.white,
        title: Text(label),
        onTap: onTap,
      ),
    );
  }
}
