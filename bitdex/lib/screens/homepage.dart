import 'dart:convert';
import 'package:bitdex/utils/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List _cryptoData = [];

  Future<List> _fetchCryptoData() async {
    final response = await http.get(
        Uri.parse(
            'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'),
        headers: {'X-CMC_PRO_API_KEY': '4b3df8c1-8866-4171-b40b-24d84795532b'});

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        _cryptoData = jsonResponse['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }

    return _cryptoData;
  }

  @override
  void initState() {
    super.initState();
    _fetchCryptoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar.getAppBar("HOMEPAGE"),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: _cryptoData.length,
            itemBuilder: (BuildContext context, int index) {
              final data = _cryptoData[index];
              final price =
                  double.parse(data['quote']['USD']['price'].toString());
              final priceString = price.toStringAsFixed(2);

              return Card(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://s2.coinmarketcap.com/static/img/coins/64x64/${data['id']}.png',
                      height: 40.0,
                      width: 40.0,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      data['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      '\$$priceString',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
