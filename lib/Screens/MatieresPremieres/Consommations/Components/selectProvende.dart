import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/Widgets/itemProvende.dart';

class SelectProvende extends StatefulWidget {
  const SelectProvende(this.title);
  final String title;

  @override
  _SelectProvendeState createState() => _SelectProvendeState(title);
}

class _SelectProvendeState extends State<SelectProvende> {
  final String title;
  _SelectProvendeState(this.title);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          child: ListView.builder(
              itemCount: provendes.length,
              itemBuilder: (context, i) => ItemProvende(i)),
        ),
      ),
    );
  }
}
