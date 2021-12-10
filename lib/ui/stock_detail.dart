import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bolsa_valores/utils/stock.dart';
import 'dart:convert';
import 'stock_card.dart';

class StockDetail extends StatefulWidget {
  final String stock;
  const StockDetail({Key? key, required this.stock}) : super(key: key);

  @override
  _StockDetailState createState() => _StockDetailState();
}

class _StockDetailState extends State<StockDetail> {
  Future<Stock> getStockInformation() async {
    var response = await http.get(
      Uri.parse(
        "https://www.alphavantage.co/query?function=OVERVIEW&symbol=" +
            widget.stock +
            "&apikey=AQO23G9DCBK41K20",
      ),
    );
    return Stock.fromJson(jsonDecode((response).body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.stock),
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Card(
          child: FutureBuilder(
            future: getStockInformation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return StockCard(stock: (snapshot.data as Stock));
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Erro ao carregar as informações"),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
