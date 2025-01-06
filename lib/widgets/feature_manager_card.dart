import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_manager/models/manager.dart';

class FeatureManagerCard extends StatelessWidget {
  const FeatureManagerCard({
    super.key,
    required this.manager,
    required this.constraint,
    required this.isHovered,
  });

  final Manager manager;
  final BoxConstraints constraint;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(manager.routePath);
      },
      child: Card(
        elevation: isHovered ? 12 : 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: isHovered ? Colors.teal[300] : Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Icon(
                manager.icon,
                color:
                    isHovered ? Colors.white : Theme.of(context).primaryColor,
                size: constraint.maxWidth < 600 ? 25 : 35,
              ),
              Text(manager.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: constraint.maxWidth < 600 ? 12 : 14,
                      color: isHovered ? Colors.white : Colors.black)),
            ]),
      ),
    );
  }
}
