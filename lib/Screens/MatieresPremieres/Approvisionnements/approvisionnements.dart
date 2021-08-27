import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:get/get.dart';

import 'Widgets/approvProdTraite.dart';
import 'Widgets/approvProvendes.dart';

class Approvisionnements extends StatefulWidget {
  const Approvisionnements({Key? key}) : super(key: key);

  @override
  _ApprovisionnementsState createState() => _ApprovisionnementsState();
}

class _ApprovisionnementsState extends State<Approvisionnements> {
  ApproController controller = Get.put(ApproController());
  final _tab = <Tab>[
    Tab(
      text: "Povendes",
    ),
    Tab(
      text: "Prod/Traitement",
    ),
  ];

  final _tabPages = <Widget>[
    ApproProvendes(),
    ApprovProdTraite(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: _tab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Approvisionnements"),
            centerTitle: true,
            elevation: 0,
          ),
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
