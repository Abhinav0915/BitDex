import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CryptoDetailsPage extends StatelessWidget {
  final dynamic data;

  CryptoDetailsPage({required this.data});

  @override
  Widget build(BuildContext context) {
    final price = double.parse(data['quote']['USD']['price'].toString());
    final priceString = price.toStringAsFixed(2);

    final website = data['urls']?['website'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data['name']),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // Handle favorite button press
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Card(
          elevation: 0.0,
          color: Colors.transparent,
          child: Column(
            children: [
              ListTile(
                leading: Image.network(
                  'https://s2.coinmarketcap.com/static/img/coins/64x64/${data['id']}.png',
                  height: 40.0,
                  width: 40.0,
                ),
                title: Text(
                  data['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                trailing: Text(
                  '\$$priceString',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              website != null
                  ? GestureDetector(
                      onTap: () async {
                        if (await canLaunch(website)) {
                          await launch(website);
                        }
                      },
                      child: ListTile(
                        title: const Text(
                          'Official Website:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        subtitle: Text(
                          website,
                          style: const TextStyle(
                            fontSize: 12.0,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
