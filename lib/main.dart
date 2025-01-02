import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rx_manager/services/auth/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBj2IPg4tXjHwuHHA3NiiatJTYyRrstI3I",
          appId: "1:939104924183:web:1aed956c9fe47c683ee252",
          messagingSenderId: "939104924183",
          projectId: "rx-manager-b1b7c"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
        debugShowCheckedModeBanner: false,
        home: AuthGate());
  }
}
