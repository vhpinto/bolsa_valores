import 'package:flutter/material.dart';
import 'package:bolsa_valores/utils/stock.dart';

class StockCard extends StatelessWidget {
  const StockCard({Key? key, required this.stock}) : super(key: key);

  final Stock stock;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Simbolo: " + stock.symbol.toString()),
            ),
            ListTile(
              title: Text("Nome: " + stock.name.toString()),
            ),
            ListTile(
              title: Text("Descrição: " + stock.description.toString()),
            ),
            ListTile(
              title: Text("Pais: " + stock.country.toString()),
            ),
            ListTile(
              title: Text("Setor: " + stock.sector.toString()),
            ),
            ListTile(
              title: Text("Industria: " + stock.industry.toString()),
            ),
            ListTile(
              title: Text("Moeda: " + stock.currency.toString()),
            ),
            ListTile(
              title: Text("Book Value:" + stock.bookValue.toString()),
            ),
            ListTile(
              title: Text(
                  "Porcentagem de lucro: " + stock.profitMargin.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
