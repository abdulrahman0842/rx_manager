import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_manager/providers/content_manager_state.dart';
import 'package:rx_manager/providers/hover_state.dart';
import 'package:rx_manager/providers/medicine_manager_state.dart';
import 'package:rx_manager/providers/navigation_card_state.dart';
import 'package:rx_manager/utils/routes/app_router.dart';
import 'package:rx_manager/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBj2IPg4tXjHwuHHA3NiiatJTYyRrstI3I",
          appId: "1:939104924183:web:1aed956c9fe47c683ee252",
          messagingSenderId: "939104924183",
          projectId: "rx-manager-b1b7c"));
  FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true, cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HoverState(),
    ),
    ChangeNotifierProvider(create: (context) => MedicineManagerState()),
    ChangeNotifierProvider(create: (context) => ContentManagerState()),
    ChangeNotifierProvider(create: (context) => NavigationCardState())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
