import 'package:flutter/material.dart';

import 'Widgets/stockOeufs.dart';
import 'Widgets/stockVolailles.dart';

class StockProduitsFinis extends StatefulWidget {
  const StockProduitsFinis({Key? key}) : super(key: key);

  @override
  _StockProduitsFinisState createState() => _StockProduitsFinisState();
}

class _StockProduitsFinisState extends State<StockProduitsFinis> {

  final _tab = <Tab>[
    Tab(
      text: "Oeufs",
    ),
    Tab(
      text: "Volailles",
    ),
  ];

  final _tabPages = <Widget>[
    StockOeufs(),
    StockVolailles(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
    );
  }
}
