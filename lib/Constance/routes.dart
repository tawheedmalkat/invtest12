import '../main.dart';

class AppRoute {
  // Auth
  static String signIn =
      sharedPref?.getString('token') == null ? "/" : "/login";

  // Home
  static String home = sharedPref?.getString('token') == null ? "/home" : "/";

  //
  static var page1 =sharedPref?.getString('token') == null ? "/page1" : "/";



}
