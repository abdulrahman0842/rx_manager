import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_manager/providers/medicine_manager_state.dart';
import 'package:rx_manager/widgets/manager_navigation_card.dart';

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
    return Scaffold(
        appBar: AppBar(title: Text('Medicine Manager')),
        body: LayoutBuilder(builder: (context, constraint) {
          return Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: width * 0.25,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  spacing: 10,
                  children: [
                    ManagerNavigationCard(
                      label: 'Add Medicine',
                      onTap: () {
                        medicineManagerState.selectWidget(0);
                      },
                    ),
                    ManagerNavigationCard(
                      label: 'Delete Medicine',
                      onTap: () {
                        medicineManagerState.selectWidget(1);
                      },
                    ),
                    ManagerNavigationCard(
                      label: 'Update Medicine',
                      onTap: () {
                        medicineManagerState.selectWidget(2);
                      },
                    ),
                    ManagerNavigationCard(
                      label: 'View Medicine',
                      onTap: () {
                        medicineManagerState.selectWidget(3);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: width * 0.4,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Consumer<MedicineManagerState>(
                    builder: (context, state, _) {
                  return state.medicineManagerWidgets[state.selectedPage];
                }),
              ),
            ],
          ));
        }));
  }
}
