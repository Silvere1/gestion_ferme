import 'package:flutter/material.dart';

class VoirFicheAllLots extends StatefulWidget {
  const VoirFicheAllLots();

  @override
  _VoirFicheAllLotsState createState() => _VoirFicheAllLotsState();
}

class _VoirFicheAllLotsState extends State<VoirFicheAllLots> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fiche de Stock Volailles"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Center(
          child: Text("Fiche de suivie pour une synthèse globale"),
        ),
      ),
    );
  }
}
