import 'package:flutter/material.dart';

class Testin extends StatelessWidget {
  Testin({super.key});
  final _focusNodes = List.generate(5, (index) => FocusNode());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Button 1")),
            ElevatedButton(onPressed: () {}, child: Text("Button 2")),
          ],
        ),
        Expanded(
          child: Column(
            children: [
              // Fixed Row of Buttons

              // Fixed Text Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // Scrollable ListView
              Expanded(
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Item $index"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ));
    // Scaffold(
    //     body: Center(
    //     child: FocusTraversalGroup(
    //       policy: OrderedTraversalPolicy(), // Enables automatic keyboard navigation
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: List.generate(
    //           5,
    //           (index) => Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Focus(
    //               focusNode: _focusNodes[index],
    //               child: GestureDetector(
    //                 onTap: () {
    //                   _focusNodes[index].requestFocus();
    //                 },
    //                 child: Container(
    //                   width: 200,
    //                   height: 50,
    //                   alignment: Alignment.center,
    //                   decoration: BoxDecoration(
    //                     color: _focusNodes[index].hasFocus
    //                         ? Colors.blue
    //                         : Colors.grey[300],
    //                     borderRadius: BorderRadius.circular(8),
    //                   ),
    //                   child: Text(
    //                     'Item ${index + 1}',
    //                     style: const TextStyle(fontSize: 18),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),);
  }
}
