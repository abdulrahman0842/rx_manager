import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
                  child: Text(
            'RxManager',
            style: TextStyle(
                fontSize: 24, color: Colors.teal, fontWeight: FontWeight.bold),
          ))),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Medicine'),
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => NewMedicineForm()));
            // },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Medicine'),
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => NewMedicineForm()));
            // },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete Medicine'),
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => NewMedicineForm()));
            // },
          ),
        ],
      ),
    );
  }
}
