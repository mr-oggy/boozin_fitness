import 'package:boozin_fitness/src/binding/home_binding.dart';
import 'package:boozin_fitness/src/screens/home/home.dart';
import 'package:boozin_fitness/src/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Splash.route,
      getPages: [
        GetPage(
          name: Splash.route,
          page: () => const Splash(),
        ),
        GetPage(
          name: Home.route,
          page: () => const Home(),
          binding: HomeBinding(),
          transition: Transition.cupertino,
        ),
      ],
    );
  }
}
