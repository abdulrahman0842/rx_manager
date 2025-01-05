import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rx_manager/models/medicine.dart';
import 'package:rx_manager/widgets/custom_drawer.dart';
import 'package:rx_manager/services/inventory/medicine_service.dart';
import 'package:rx_manager/widgets/medicine_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxManager'),
      ),
      body: StreamBuilder(
          stream: MedicineService().getMedicines(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('An error occurred'));
            }
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: Text('No Medicines available'),
              );
            }
            log(snapshot.data.toString());
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final Medicine medicine = snapshot.data![index];
                  return ListTile(
                      onTap: () {
                        MedicineService().deleteMedicine(medicine.id!);
                      },
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MedicineForm(
                                      isEditing: true,
                                      medicine: medicine,
                                    )));
                      },
                      title: Text(medicine.name),
                      subtitle: Text(medicine.company),
                      trailing: Text(medicine.id ?? ''));
                });
          }),
      drawer: CustomDrawer(),
    );
  }
}
