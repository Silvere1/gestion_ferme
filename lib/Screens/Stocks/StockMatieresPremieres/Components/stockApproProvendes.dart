import 'package:flutter/material.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Widgets/approvProvendes.dart';

class StockApproProvendes extends StatefulWidget {
  const StockApproProvendes();

  @override
  _StockApproProvendesState createState() => _StockApproProvendesState();
}

class _StockApproProvendesState extends State<StockApproProvendes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Approvisionnement Provendes"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: ApproProvendes(),
      ),
    );
  }
}
