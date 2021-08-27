import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:get/get.dart';

import 'Widgets/cEau.dart';
import 'Widgets/cProvende.dart';
import 'Widgets/cTraitement.dart';

class Alimantations extends StatefulWidget {
  const Alimantations({Key? key}) : super(key: key);

  @override
  _AlimantationsState createState() => _AlimantationsState();
}

class _AlimantationsState extends State<Alimantations> {
  ConsommationController controller = Get.find();
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
