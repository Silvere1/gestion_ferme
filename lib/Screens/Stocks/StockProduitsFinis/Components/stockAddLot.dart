import 'package:flutter/material.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Lots/lots.dart';

class StockAddLot extends StatefulWidget {
  const StockAddLot();

  @override
  _StockAddLotState createState() => _StockAddLotState();
}

class _StockAddLotState extends State<StockAddLot> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lots de Volailles"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Lots(),
      ),
    );
  }
}
