import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Lots/addLots.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Components/voirFicheStock.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Widgets/reajustementVolailles.dart';
import 'package:get/get.dart';

import 'itemStockVolaille.dart';

class StockVolailles extends StatefulWidget {
  const StockVolailles();

  @override
  _StockVolaillesState createState() => _StockVolaillesState();
}

class _StockVolaillesState extends State<StockVolailles>
    with TickerProviderStateMixin {
  AddLotController controller = Get.find();
  late ScrollController scrollController;
  bool dialVisible = true;

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
          child: Icon(Icons.visibility),
          backgroundColor: Colors.white,
          label: 'Voir fiche',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => controller.lotsExist.length != 0
              ? Get.to(() => VoirFicheStock())
              : Get.snackbar("Attention !", "Vous ne disposez d'aucune donnée.",
                  duration: Duration(seconds: 5), colorText: Colors.white),
        ),
        SpeedDialChild(
          child: Icon(Icons.tune),
          backgroundColor: Colors.white,
          label: 'Réajustement',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => ReajustementVolailles()),
        ),
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
          label: 'Créer un lot',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => AddLots()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            "Semaines",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          )),
          Container(
            margin: EdgeInsets.only(top: 4, left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1,
                  spreadRadius: 0.1,
                )
              ],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              elevation: 0.6,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("0 à 12"),
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          Obx(() =>
                              Text("${controller.allVoByAge1} volailles")),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 100,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("12 à 24"),
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          Obx(() =>
                              Text("${controller.allVoByAge2} volailles")),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 100,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("24 à +"),
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          Obx(() =>
                              Text("${controller.allVoByAge3} volailles")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Obx(() => Text(
                  "Total : ${controller.allVoByAge3.value + controller.allVoByAge2.value + controller.allVoByAge1.value} volailles",
                  style: TextStyle(fontWeight: FontWeight.w600),
                )),
          ),
          Expanded(
            child: FutureBuilder(
                future: controller.getListLots(),
                builder: (_, snapshot) {
                  return snapshot.hasData
                      ? Obx(() => controller.listlot.length != 0
                          ? ListView.builder(
                              padding: EdgeInsets.only(bottom: 40),
                              physics: BouncingScrollPhysics(),
                              // controller: scrollController,
                              itemCount: controller.listlot.length,
                              itemBuilder: (context, i) =>
                                  ItemStockVolailles(i),
                            )
                          : Center(
                              child: Text(
                                "Vous ne disposez d'aucun lot de volailles!",
                                textAlign: TextAlign.center,
                              ),
                            ))
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
          ),
        ],
      ),
      floatingActionButton: buildFloatingButton(),
    );
  }
}
