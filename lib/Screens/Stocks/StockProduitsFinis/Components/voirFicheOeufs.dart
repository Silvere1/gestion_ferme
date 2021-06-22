import 'package:flutter/material.dart';

class VoirFicheOeufs extends StatefulWidget {
  const VoirFicheOeufs({Key? key}) : super(key: key);

  @override
  _VoirFicheOeufsState createState() => _VoirFicheOeufsState();
}

class _VoirFicheOeufsState extends State<VoirFicheOeufs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fiche de stock Oeufs"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Center(
          child: Text("Fiche de suivie du stock des ouefs"),
        ),
      ),
    );
  }
}
