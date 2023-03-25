import 'package:bitdex/constants/appcolors.dart';
import 'package:bitdex/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bitdex/screens/login.dart';
import 'package:bitdex/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BitDex());
}

class BitDex extends StatelessWidget {
  const BitDex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = {
      '/': (context) => const login(),
      '/signup': (context) => const signup(),
      '/homepage': (context) => const homepage(),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/homepage',
      routes: routes,
    );
  }
}
