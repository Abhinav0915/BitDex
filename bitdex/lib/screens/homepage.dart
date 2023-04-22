import 'package:bitdex/utils/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'favorite.dart';
import '../models/api.dart';
import '../screens/login.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List _cryptoData = [];

  @override
  void initState() {
    super.initState();
    _fetchCryptoData();
  }

  Future<void> _fetchCryptoData() async {
    final cryptoData = await Api.fetchCryptoData();
    setState(() {
      _cryptoData = cryptoData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // bottomNavigationBar: BottomNavigationBar(s
        //   currentIndex: _currentIndex, // set the currentIndex property
        //   // onTap: _onTabTapped,
        //   backgroundColor: AppColors.purple,
        //   elevation: 20.0,
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.favorite),
        //       label: 'Favorites',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.logout),
        //       label: 'Log Out',
        //     ),
        //   ],
        // ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('BitDex'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: const Text('Favorites'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Log Out'),
                leading: Icon(Icons.logout),
                onTap: () {
                  onPressed:
                  () {
                    FirebaseAuth.instance.signOut().then((value) =>
                        MaterialPageRoute(builder: (context) => const login()));
                  };
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                },
              ),
            ],
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.purple, Colors.green],
              ),
            ),
            child: GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/cryptodetails');
              },
              child: ListView.builder(
                itemCount: _cryptoData.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = _cryptoData[index];
                  final price =
                      double.parse(data['quote']['USD']['price'].toString());
                  final priceString = price.toStringAsFixed(2);

                  return Card(
                    elevation: 0.0,
                    color: Colors.transparent,

                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 10.0, vertical: 5.0),
                    child: ListTile(
                      leading: Image.network(
                        'https://s2.coinmarketcap.com/static/img/coins/64x64/${data['id']}.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      title: Text(
                        data['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '\$$priceString',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )));
  }
}
