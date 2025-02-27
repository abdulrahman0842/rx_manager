import 'package:go_router/go_router.dart';
import 'package:rx_manager/view/test.dart';

import '../../services/auth/auth_gate.dart';
import '../../view/content_manager/content_manager_screen.dart';
import '../../view/home_screen.dart';
import '../../view/login_screen.dart';
import '../../view/medicine_manager/medicine_manager_screen.dart';
import '../../view/storage_manager/storage_manager_screen.dart';
import 'route_names.dart';

final GoRouter appRouter = GoRouter(routes: [
  GoRoute(path: RouteNames.authGate, builder: (context, state) => AuthGate()),
  GoRoute(path: RouteNames.home, builder: (context, state) => HomeScreen()),
  GoRoute(path: RouteNames.login, builder: (context, state) => LoginScreen()),
  GoRoute(
      path: RouteNames.medicineManager,
      builder: (context, state) => MedicineManagerScreen()),
  GoRoute(
      path: RouteNames.contentManager,
      builder: (context, state) => ContentManagerScreen()),
  GoRoute(
      path: RouteNames.storageManager,
      builder: (context, state) => StorageManagerScreen()),
  GoRoute(path: RouteNames.test, builder: (context, state) => Testin())
]);
