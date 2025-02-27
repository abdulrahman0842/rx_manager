import 'package:flutter/material.dart';
import 'package:rx_manager/view/content_manager/content_form.dart';
import 'package:rx_manager/view/content_manager/content_list.dart';

class ContentManagerScreen extends StatefulWidget {
  const ContentManagerScreen({super.key});

  @override
  State<ContentManagerScreen> createState() => _ContnetManagerState();
}

class _ContnetManagerState extends State<ContentManagerScreen> {
  final _navItems = ["Add", "Update", "Delete", "View"];
  final _contentManagerWidgets = [
    ContentForm(),
    ContentList(
      isEditing: true,
    ),
    ContentList(
      isDeleting: true,
    ),
    ContentList(
      isViewing: true,
    ),
  ];
  final _selectedNavIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text('Content Manager')),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: width * 0.8,
            child: ValueListenableBuilder(
              valueListenable: _selectedNavIndex,
              builder: (context, value, _) {
                return Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                          spacing: 20,
                          children: List.generate(
                              _navItems.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      _selectedNavIndex.value = index;
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: _selectedNavIndex.value ==
                                                  index
                                              ? Colors.grey
                                              : Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(_navItems[index],
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ))),
                      _contentManagerWidgets[_selectedNavIndex.value],
                    ]);
              },
            ),
          ),
        ));
  }
}
