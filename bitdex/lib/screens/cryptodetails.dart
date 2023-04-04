import 'package:flutter/material.dart';

class CryptoDetailsPage extends StatelessWidget {
  final dynamic data;

  CryptoDetailsPage({required this.data});

  @override
  Widget build(BuildContext context) {
    final price = double.parse(data['quote']['USD']['price'].toString());
    final priceString = price.toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(
        title: Text(data['name']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://s2.coinmarketcap.com/static/img/coins/64x64/${data['id']}.png',
              height: 80.0,
              width: 80.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Name: ${data['name']}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Symbol: ${data['symbol']}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Price: \$$priceString',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
