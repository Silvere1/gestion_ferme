import 'package:flutter/material.dart';

import 'Widgets/addLotByAchat.dart';
import 'Widgets/addLotByEclosion.dart';

class AddLots extends StatefulWidget {
  const AddLots({Key? key}) : super(key: key);

  @override
  _AddLotsState createState() => _AddLotsState();
}

class _AddLotsState extends State<AddLots> {
  final _tab = <Tab>[
    Tab(
      text: "Eclosion",
    ),
    Tab(
      text: "Achat",
    ),
  ];
  final _tabPages = <Widget>[
    AddLotByEclosion(),
    AddLotByAchat(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: _tab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Ajouter un lot de volailles"),
            centerTitle: true,
            elevation: 0,
            bottom: TabBar(tabs: _tab),
          ),
          body: TabBarView(
            children: _tabPages,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
