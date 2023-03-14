import 'package:bitdex/constants/appcolors.dart';
import 'package:bitdex/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:bitdex/screens/login.dart';


void main() {
  runApp(const BitDex());
}

class BitDex extends StatelessWidget {
  const BitDex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = {
      '/': (context) => const login(),
      '/signup' : (context) => const signup(),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
