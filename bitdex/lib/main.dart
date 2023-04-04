import 'package:bitdex/screens/cryptodetails.dart';
import 'package:bitdex/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bitdex/screens/login.dart';
import 'package:bitdex/screens/splash.dart';
import 'package:bitdex/screens/homepage.dart';
import '../screens/cryptodetails.dart';

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
      // '/cryptodetails': (context) => CryptoDetailsPage(),
      '/signup': (context) => const signup(),
      '/homepage': (context) => const homepage(),
      '/splash': (context) => const splash(),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/splash',
      routes: routes,
    );
  }
}
