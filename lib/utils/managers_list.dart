import 'package:flutter/material.dart';
import 'package:rx_manager/models/manager.dart';
import 'package:rx_manager/utils/routes/route_names.dart';

List<Manager> managersList = [
  Manager(
      icon: Icons.business,
      label: 'Agency Manager',
      routePath: RouteNames.test),
  Manager(icon: Icons.domain, label: 'Company Manager', routePath: ''),
  Manager(
      icon: Icons.medication_liquid_outlined,
      label: 'Content Manager',
      routePath: RouteNames.contentManager),
  Manager(
      icon: Icons.medical_services,
      label: 'Medicine Manager',
      routePath: RouteNames.medicineManager),
  Manager(
      icon: Icons.shopping_cart, label: 'Purchase Bill Manager', routePath: ''),
  Manager(icon: Icons.receipt, label: 'Sales Bill Manager', routePath: ''),
  Manager(
      icon: Icons.storage,
      label: 'Storage Manager',
      routePath: RouteNames.storageManager),
];
