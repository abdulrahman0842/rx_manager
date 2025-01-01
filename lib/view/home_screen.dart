import 'package:flutter/material.dart';
import 'package:rx_manager/components/custom_drawer.dart';
import 'package:rx_manager/services/inventory/medicine_service.dart';

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
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data?[index]['name']),
                    subtitle: Text(snapshot.data?[index]['company']),
                    // trailing: DropdowmM,
                  );
                });
          }),
      drawer: CustomDrawer(),
    );
  }
}
