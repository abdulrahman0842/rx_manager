import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_manager/services/auth/auth_service.dart';
import 'package:rx_manager/services/hover_state.dart';
import 'package:rx_manager/utils/utils.dart';
import 'package:rx_manager/widgets/small_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> managers = [
    {'icon': Icons.business, 'label': 'Agency Manager'},
    {'icon': Icons.domain, 'label': 'Company Manager'},
    {'icon': Icons.category, 'label': 'Content Manager'},
    {'icon': Icons.medical_services, 'label': 'Medicine Manager'},
    {'icon': Icons.shopping_cart, 'label': 'Purchase Bill Manager'},
    {'icon': Icons.receipt, 'label': 'Sales Bill Manager'},
    {'icon': Icons.storage, 'label': 'Storage Manager'},
  ];

  // late List<bool> hoverState;
  ValueNotifier<List<bool>> hoverState =
      ValueNotifier<List<bool>>(List.filled(7, false));

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('RxManager'),
        actions: [
          SmallButton(
            label: 'Logout',
            onTap: () {
              AuthService().logout();
              Future.delayed(Duration(seconds: 2));
              Navigator.pop(context);
              Utils.flushBarSuccessMessage("Logout Successful", context);
            },
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: width * 0.7,
          child: LayoutBuilder(
            builder: (context, constraint) {
              int crossAxisCount = (constraint.maxWidth / 200).floor();
              return GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1),
                  itemCount: managers.length,
                  itemBuilder: (context, index) {
                    var manager = managers[index];
                    return Consumer<HoverState>(
                        builder: (context, hoverState, _) {
                      return MouseRegion(
                          onEnter: (_) {
                            hoverState.setHover(index, true);
                          },
                          onExit: (_) {
                            hoverState.setHover(index, false);
                          },
                          child: FeatureManagerCard(
                              manager: manager,
                              constraint: constraint,
                              isHovered: hoverState.hoverState[index]));
                    });
                  });
            },
          ),
        ),
      ),
    );
  }
}

class FeatureManagerCard extends StatelessWidget {
  const FeatureManagerCard({
    super.key,
    required this.manager,
    required this.constraint,
    required this.isHovered,
  });

  final Map<String, dynamic> manager;
  final BoxConstraints constraint;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isHovered ? 12 : 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isHovered ? Colors.teal[300] : Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Icon(
              manager['icon'],
              color: isHovered ? Colors.white : Theme.of(context).primaryColor,
              size: constraint.maxWidth < 600 ? 25 : 35,
            ),
            Text(manager['label'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: constraint.maxWidth < 600 ? 12 : 14,
                    color: isHovered ? Colors.white : Colors.black)),
          ]),
    );
  }
}
