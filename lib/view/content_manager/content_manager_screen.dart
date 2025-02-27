import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_manager/providers/content_manager_state.dart';
import 'package:rx_manager/widgets/manager_navigation_card.dart';

class ContentManagerScreen extends StatefulWidget {
  const ContentManagerScreen({super.key});

  @override
  State<ContentManagerScreen> createState() => _ContnetManagerState();
}

class _ContnetManagerState extends State<ContentManagerScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Content Manager')),
      body: Row(children: [
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
              // ManagerNavigationCard(
              //   label: 'Add Content',
              //   onTap: () {
              //     ContentManagerState().selectWidget(0);
              //   },
              // ),
              // ManagerNavigationCard(
              //   label: 'Delete Content',
              //   onTap: () {
              //     ContentManagerState().selectWidget(0);
              //   },
              // ),
              // ManagerNavigationCard(
              //   label: 'Update Content',
              //   onTap: () {
              //     ContentManagerState().selectWidget(0);
              //   },
              // ),
              // ManagerNavigationCard(
              //   label: 'View Content-wise-Medicines',
              //   onTap: () {
              //     ContentManagerState().selectWidget(0);
              //   },
              // ),
            ],
          ),
        ),
        Consumer<ContentManagerState>(
          builder: (context, state, _) {
            return Container(
                width: width * 0.4,
                child: state.contentManagerWidget[state.selectedIndex]);
          },
        )
      ]),
    );
  }
}
