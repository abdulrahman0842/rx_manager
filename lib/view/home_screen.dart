import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_manager/services/auth/auth_service.dart';
import 'package:rx_manager/services/hover_state.dart';
import 'package:rx_manager/utils/managers_list.dart';
import 'package:rx_manager/utils/utils.dart';
import 'package:rx_manager/widgets/feature_manager_card.dart';
import 'package:rx_manager/widgets/small_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  itemCount: managersList.length,
                  itemBuilder: (context, index) {
                    var manager = managersList[index];
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
                            isHovered: hoverState.hoverState[index],
                          ));
                    });
                  });
            },
          ),
        ),
      ),
    );
  }
}
