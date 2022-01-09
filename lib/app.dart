import 'package:boozin_fitness/src/screens/home/home.dart';
import 'package:boozin_fitness/src/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Splash()),
        GetPage(name: '/home', page: () => Home()),
      ],
    );
  }
}
