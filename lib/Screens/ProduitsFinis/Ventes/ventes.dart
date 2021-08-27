import 'package:flutter/material.dart';

import 'Widgets/venteOeufs.dart';
import 'Widgets/venteVolailles.dart';

class Ventes extends StatefulWidget {
  const Ventes();

  @override
  _VentesState createState() => _VentesState();
}

class _VentesState extends State<Ventes> {
  final _tab = <Tab>[
    Tab(
      text: "Oeufs",
    ),
    Tab(
      text: "Volailles",
    ),
  ];

  final _tabPages = <Widget>[
    VenteOeufs(),
    VenteVolailles(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: _tab.length,
        child: Scaffold(
          backgroundColor: Color(0xffeeeeee),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 0, left: 0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    //borderRadius: BorderRadius.circular(10),
                  ),
                  child: TabBar(
                    //controller: _tabController,
                    indicatorColor: Colors.white,
                    indicatorWeight: 4,
                    //indicatorPadding: EdgeInsets.only(left: 12, right: 12),
                    tabs: _tab,
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: _tabPages,
                physics: NeverScrollableScrollPhysics(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
