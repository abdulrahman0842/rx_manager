import 'package:flutter/material.dart';

class MedicineManagerScreen extends StatelessWidget {
  const MedicineManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
      return Expanded(
          child: Row(
        children: [
          Container(
            width: width * 0.3,
            color: Colors.grey,
          )
        ],
      ));
    }));
  }
}
