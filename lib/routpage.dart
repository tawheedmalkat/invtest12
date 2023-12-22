import 'package:get/get.dart';
import 'UI/screens/Home.dart';
import 'UI/screens/login.dart';
import 'constance/routes.dart';

List<GetPage<dynamic>>? routes = [
  // Auth
  GetPage(name: AppRoute.signIn, page: () => LogIn()),

  // Home
  GetPage(name: AppRoute.home, page: () => Home()),

];
