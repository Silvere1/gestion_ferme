import 'package:flutter/material.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/Widgets/cProvende.dart';

class StockConsomProvendes extends StatefulWidget {
  const StockConsomProvendes();

  @override
  _StockConsomProvendesState createState() => _StockConsomProvendesState();
}

class _StockConsomProvendesState extends State<StockConsomProvendes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Consommation Provendes"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Center(child: CProvende()),
      ),
    );
  }
}
