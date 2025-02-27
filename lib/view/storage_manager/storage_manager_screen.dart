import 'package:flutter/material.dart';

class StorageManagerScreen extends StatefulWidget {
  const StorageManagerScreen({super.key});

  @override
  State<StorageManagerScreen> createState() => _StorageManagerScreenState();
}

class _StorageManagerScreenState extends State<StorageManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Storage Manager")));
  }
}
