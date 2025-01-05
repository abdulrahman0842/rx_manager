import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const SmallButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: width * 0.025,
        width: width * 0.06,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
