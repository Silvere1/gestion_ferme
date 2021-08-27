import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:gestionferme/Screens/ProduitsFinis/CollecteOeufs/collecteOeufs.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Components/voirFicheStock.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Widgets/reajustementOeufs.dart';
import 'package:get/get.dart';

import 'itemStockOeufs.dart';

class StockOeufs extends StatefulWidget {
  const StockOeufs();

  @override
  _StockOeufsState createState() => _StockOeufsState();
}

class _StockOeufsState extends State<StockOeufs> with TickerProviderStateMixin {
  CollecteOeufsController controller = Get.find();
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
              : Get.snackbar("Attention !", "Vous ne disposez d'aucune donnée",
                  duration: Duration(seconds: 5), colorText: Colors.white),
        ),
        SpeedDialChild(
          child: Icon(Icons.tune),
          backgroundColor: Colors.white,
          label: 'Réajustement',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => ReajustementOeufs()),
        ),
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
          label: 'Nouvelle collecte',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => CollecteOeufs()),
        ),
      ],
    );
  }

  int touchedIndex = -1;

  int lastPanStartOnIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: ListView(
        controller: scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1,
                      spreadRadius: 0.1,
                    )
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  elevation: 0.9,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Petits"),
                              Container(
                                height: 1,
                                color: Colors.black,
                              ),
                              Text("${controller.stockOeuf.petits}"),
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
                              Text("Moyens"),
                              Container(
                                height: 1,
                                color: Colors.black,
                              ),
                              Text("${controller.stockOeuf.moyens}"),
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
                              Text("Grands"),
                              Container(
                                height: 1,
                                color: Colors.black,
                              ),
                              Text("${controller.stockOeuf.grands}"),
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
                child: Text("Total : ${controller.stockOeuf.total}"),
              ),
              controller.stockOeuf.total > 0
                  ? Container(
                      height: MediaQuery.of(context).size.width * 0.5,
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: 40,
                          sectionsSpace: 2,
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              final desiredTouch = pieTouchResponse.touchInput
                                      is! PointerExitEvent &&
                                  pieTouchResponse.touchInput
                                      is! PointerUpEvent;
                              if (desiredTouch &&
                                  pieTouchResponse.touchedSection != null) {
                                touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              } else {
                                touchedIndex = -1;
                              }
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sections: showMySections(),
                        ),
                        swapAnimationCurve: Curves.linear,
                        swapAnimationDuration: Duration(milliseconds: 150),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Text("Le stock d'oeufs est vide !"),
                      ),
                    ),
              controller.stockOeuf.total > 0
                  ? Container(
                      child: Center(
                        child: Text("Historique des collections"),
                      ),
                    )
                  : Container(),
            ],
          ),
          FutureBuilder(
              future: controller.getListCollecte(),
              builder: (_, snapshot) {
                return snapshot.hasData
                    ? Obx(
                        () => controller.listCollecteOuf.length != 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(bottom: 50),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.listCollecteOuf.length,
                                itemBuilder: (context, i) => ItemStockOeufs(
                                    controller.listCollecteOuf[i]),
                              )
                            : Center(
                                child: Text(
                                    "Aucune collecte d'oeuf n'est encore effectuée !"),
                              ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
        ],
      ),
      floatingActionButton: buildFloatingButton(),
    );
  }

  List<PieChartSectionData> showMySections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 18.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xff0293ee),
            value: controller.stockOeuf.petits.toDouble(),
            title: '${controller.stockOeuf.petits}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xfff8b250),
            value: controller.stockOeuf.moyens.toDouble(),
            title: '${controller.stockOeuf.moyens}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xff845bef),
            value: controller.stockOeuf.grands.toDouble(),
            title: '${controller.stockOeuf.grands}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          );
        default:
          throw Error();
      }
    });
  }
}
