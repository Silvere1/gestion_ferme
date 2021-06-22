import 'package:flutter/material.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Widgets/approvProdTraite.dart';

class StockApproProdTraite extends StatefulWidget {
  const StockApproProdTraite();

  @override
  _StockApproProdTraiteState createState() => _StockApproProdTraiteState();
}

class _StockApproProdTraiteState extends State<StockApproProdTraite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Appro Produit de Traitement"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: ApprovProdTraite(),
      ),
    );
  }
}
