import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gestionferme/App/Models/lotModel.dart';

import 'archiveAlertDialog.dart';

class VoirFicheLot extends StatefulWidget {
  const VoirFicheLot(this.lot);
  final Lot lot;

  @override
  _VoirFicheLotState createState() => _VoirFicheLotState(lot);
}

class _VoirFicheLotState extends State<VoirFicheLot>
    with TickerProviderStateMixin {
  final Lot lot;

  late ScrollController scrollController;
  bool dialVisible = true;

  _VoirFicheLotState(this.lot);

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  SpeedDial buildFloatingButton() {
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      visible: dialVisible,
      children: [
        SpeedDialChild(
          child: Icon(Icons.delete),
          backgroundColor: Colors.red,
          label: 'Archiver',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            showDialog(
                context: context,
                builder: (_) {
                  return ArchiveAlertDialog(lot);
                });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Stock du lot N° : ${lot.num}"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Center(
          child: Text("Fiche de suivie journalière de lot ${lot.num}"),
        ),
        floatingActionButton: buildFloatingButton(),
      ),
    );
  }
}
