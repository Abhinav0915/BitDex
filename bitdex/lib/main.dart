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
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
