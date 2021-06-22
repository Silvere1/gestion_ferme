import 'package:flutter/material.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/Widgets/cTraitement.dart';

class StockConsomProdTraite extends StatefulWidget {
  const StockConsomProdTraite();

  @override
  _StockConsomProdTraiteState createState() => _StockConsomProdTraiteState();
}

class _StockConsomProdTraiteState extends State<StockConsomProdTraite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Consommation Prod/Traitement"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Center(child: CTraitement()),
      ),
    );
  }
}
