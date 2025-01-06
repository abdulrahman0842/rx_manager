import 'package:flutter/material.dart';
import 'package:rx_manager/models/manager.dart';

List<Manager> managersList = [
  Manager(icon: Icons.business, label: 'Agency Manager', routePath: ''),
  Manager(icon: Icons.domain, label: 'Company Manager', routePath: ''),
  Manager(icon: Icons.category, label: 'Content Manager', routePath: ''),
  Manager(
      icon: Icons.medical_services,
      label: 'Medicine Manager',
      routePath: '/medicineManager'),
  Manager(
      icon: Icons.shopping_cart, label: 'Purchase Bill Manager', routePath: ''),
  Manager(icon: Icons.receipt, label: 'Sales Bill Manager', routePath: ''),
  Manager(icon: Icons.storage, label: 'Storage Manager', routePath: ''),
];
