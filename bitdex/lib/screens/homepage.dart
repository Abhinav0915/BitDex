import 'package:bitdex/main.dart';
import 'package:bitdex/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bitdex/utils/appbar.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.getAppBar("BitDex"),
    );
  }
}





// floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           FirebaseAuth.instance
//               .signOut()
//               .then((value) => Navigator.pushNamed(context, '/'));
//         },
//         child: const Icon(Icons.add),
//       ),