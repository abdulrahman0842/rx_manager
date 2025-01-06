import 'package:go_router/go_router.dart';
import 'package:rx_manager/services/auth/auth_gate.dart';
import 'package:rx_manager/view/home_screen.dart';
import 'package:rx_manager/view/login_screen.dart';
import 'package:rx_manager/view/medicine_manager_screen.dart';

final GoRouter appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => AuthGate()),
  GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
  GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
  GoRoute(
      path: '/medicineManager',
      builder: (context, state) => MedicineManagerScreen()),
]);
