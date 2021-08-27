import 'package:flutter/material.dart';
import 'package:gestionferme/Screens/ProduitsFinis/CollecteOeufs/listCollecteOeuf.dart';

class NewCollecte extends StatefulWidget {
  const NewCollecte({Key? key}) : super(key: key);

  @override
  _NewCollecteState createState() => _NewCollecteState();
}

class _NewCollecteState extends State<NewCollecte> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Collecte d'Oeufs"),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListCollecteOeuf(),
      ),
    );
  }
}
