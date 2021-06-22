import 'package:flutter/material.dart';

import 'Widgets/cEau.dart';
import 'Widgets/cProvende.dart';
import 'Widgets/cTraitement.dart';

class Consommations extends StatefulWidget {
  const Consommations({Key? key}) : super(key: key);

  @override
  _ConsommationsState createState() => _ConsommationsState();
}

class _ConsommationsState extends State<Consommations> {
  final _tab = <Tab>[
    Tab(
      text: "Povendes",
    ),
    Tab(
      text: "Eau",
    ),
    Tab(
      text: "Traitement",
    ),
  ];

  final _tabPages = <Widget>[
    CProvende(),
    CEau(),
    CTraitement(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: _tab.length,
        child: Scaffold(
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
              Expanded(child: TabBarView(children: _tabPages)),
            ],
          ),
        ),
      ),
    );
  }
}
