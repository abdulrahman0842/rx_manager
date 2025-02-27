import 'package:go_router/go_router.dart';
import 'package:rx_manager/services/auth/auth_gate.dart';
import 'package:rx_manager/utils/routes/route_names.dart';
import 'package:rx_manager/view/content_manager/content_manager_screen.dart';
import 'package:rx_manager/view/home_screen.dart';
import 'package:rx_manager/view/login_screen.dart';
import 'package:rx_manager/view/medicine_manager/medicine_manager_screen.dart';

final GoRouter appRouter = GoRouter(routes: [
  GoRoute(path: RouteNames.authGate, builder: (context, state) => AuthGate()),
  GoRoute(path: RouteNames.home, builder: (context, state) => HomeScreen()),
  GoRoute(path: RouteNames.login, builder: (context, state) => LoginScreen()),
  GoRoute(
      path: RouteNames.medicineManager,
      builder: (context, state) => MedicineManagerScreen()),
  GoRoute(
      path: RouteNames.contentManager,
      builder: (context, state) => ContentManagerScreen())
]);
