import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/stockAddLot.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Components/reajustementVolailles.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Components/voirFicheAllLots.dart';
import 'package:get/get.dart';

import 'itemStockVolaille.dart';

class StockVolailles extends StatefulWidget {
  const StockVolailles();

  @override
  _StockVolaillesState createState() => _StockVolaillesState();
}

class _StockVolaillesState extends State<StockVolailles>
    with TickerProviderStateMixin {
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
          backgroundColor: Colors.red,
          label: 'Voir fiche',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => VoirFicheAllLots()),
        ),
        SpeedDialChild(
          child: Icon(Icons.tune),
          backgroundColor: Colors.lightBlue,
          label: 'Réajustement',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => ReajustementVolailles()),
        ),
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          label: 'Créer un lot',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => StockAddLot()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text("Semaines")),
          Container(
            margin: EdgeInsets.only(top: 4, left: 10, right: 10, bottom: 10),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              elevation: 2,
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
                          Text("124 volailles"),
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
                          Text("540 volailles"),
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
                          Text("500 volailles"),
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
            child: Text("Total : XXXX"),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 40),
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              itemCount: lots.length,
              itemBuilder: (context, i) => ItemStockVolailles(i),
            ),
          ),
        ],
      ),
      floatingActionButton: buildFloatingButton(),
    );
  }
}
