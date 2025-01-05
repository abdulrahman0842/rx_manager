import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String label;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).primaryColorDark,
            ),
            width: MediaQuery.sizeOf(context).width * 0.15,
            height: MediaQuery.sizeOf(context).width * 0.03,
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            )));
  }
}
