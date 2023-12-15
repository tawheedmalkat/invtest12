//save user data commit2
///////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:invoportapp/routpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

SharedPreferences? sharedPref;
void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}

