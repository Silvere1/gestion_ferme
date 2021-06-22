import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';
import 'package:get/get.dart';

import 'Widgets/usageOeufs.dart';
import 'Widgets/usageVolailles.dart';

class Usages extends StatefulWidget {
  const Usages({Key? key}) : super(key: key);

  @override
  _UsagesState createState() => _UsagesState();
}

class _UsagesState extends State<Usages> {
  UsageController controller = Get.put(UsageController());
  final _tab = <Tab>[
    Tab(
      text: "Oeufs",
    ),
    Tab(
      text: "Volailles",
    ),
  ];

  final _tabPages = <Widget>[
    UsageOeufs(),
    UsageVolailles(),
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
