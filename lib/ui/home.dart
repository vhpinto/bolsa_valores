import 'package:flutter/material.dart';
import 'stock_detail.dart';
import 'package:bolsa_valores/utils/stock_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bolsa de valores"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: StockList.stockList.entries.map((entry) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StockDetail(stock: entry.key)));
              },
              child: Card(
                child: ListTile(
                  title: Text(entry.value),
                  subtitle: Text(entry.key),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
