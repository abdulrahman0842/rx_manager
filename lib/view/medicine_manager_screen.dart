import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_manager/providers/medicine_manager_state.dart';
import 'package:rx_manager/utils/theme.dart';

class MedicineManagerScreen extends StatefulWidget {
  const MedicineManagerScreen({super.key});

  @override
  State<MedicineManagerScreen> createState() => _MedicineManagerScreenState();
}

class _MedicineManagerScreenState extends State<MedicineManagerScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var medicineManagerState = context.read<MedicineManagerState>();
    return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
      return Expanded(
          child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: width * 0.25,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Card(
                  color: secondaryColor,
                  child: ListTile(
                    title: Text('Add Medicine'),
                    onTap: () {
                      medicineManagerState.selectWidget(0);
                    },
                  ),
                ),
                Card(
                  color: secondaryColor,
                  child: ListTile(
                    title: Text('Update Medicine'),
                    onTap: () {
                      medicineManagerState.selectWidget(1);
                    },
                  ),
                ),
                Card(
                  color: secondaryColor,
                  child: ListTile(
                    title: Text('Delete Medicine'),
                    onTap: () {
                      medicineManagerState.selectWidget(2);
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Consumer<MedicineManagerState>(builder: (context, state, _) {
              return state.medicineManagerWidgets[state.selectedPage];
            }),
          ))
        ],
      ));
    }));
  }
}
