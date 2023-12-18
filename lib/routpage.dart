//test
import 'package:get/get.dart';
import 'package:invoportapp/UI/screens/UserDataScreen.dart';
import 'UI/screens/Home.dart';
import 'UI/screens/login.dart';
import 'Controller/Auth/page-pdf.dart';
import 'UI/screens/pdfpage.dart';
import 'constance/routes.dart';

List<GetPage<dynamic>>? routes = [
  // Auth
  GetPage(name: AppRoute.signIn, page: () =>  LogIn()),

  // Home
  GetPage(name: AppRoute.home, page: () =>  Home()),
  GetPage(name: AppRoute.page1, page: () =>  UserDataScreen(userModels: [],)),
  GetPage(name: AppRoute.pdf, page: () =>  PdfPage()),

  //UserDataScreen

];
