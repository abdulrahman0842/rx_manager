import 'package:flutter/material.dart';
import 'package:rx_manager/utils/theme.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.textButtonLabel,
    required this.elevatedButtonLabel,
    required this.textButtonOnTap,
    required this.elevatedButtonOnTap,
  });
  final String textButtonLabel;
  final String elevatedButtonLabel;
  final Function() textButtonOnTap;
  final Function() elevatedButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextButton(
                onPressed: textButtonOnTap, child: Text(textButtonLabel))),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: elevatedButtonOnTap,
              child: Text(elevatedButtonLabel,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
        ),
      ],
    );
  }
}
