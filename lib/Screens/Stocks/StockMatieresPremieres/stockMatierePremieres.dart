import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:get/get.dart';

import 'Widgets/stockProdTraite.dart';
import 'Widgets/stockProvende.dart';

class StockMatieresPremieres extends StatefulWidget {
  const StockMatieresPremieres({Key? key}) : super(key: key);

  @override
  _StockMatieresPremieresState createState() => _StockMatieresPremieresState();
}

class _StockMatieresPremieresState extends State<StockMatieresPremieres> {
  ApproController controller = Get.put(ApproController());
  final _tab = <Tab>[
    Tab(
      text: "Provendes",
    ),
    Tab(
      text: "Prod / Traitement",
    ),
  ];

  final _tabPages = <Widget>[
    StockProvende(),
    StockProTraite(),
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
            Expanded(
                child: TabBarView(
              children: _tabPages,
              physics: NeverScrollableScrollPhysics(),
            )),
          ],
        ),
      ),
    );
  }
}
