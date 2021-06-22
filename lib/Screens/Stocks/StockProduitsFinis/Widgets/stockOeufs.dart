import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gestionferme/Screens/ProduitsFinis/CollecteOeufs/collecteOeufs.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Components/reajustementOeufs.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Components/voirFicheOeufs.dart';
import 'package:get/get.dart';

import 'itemStockOeufs.dart';

class StockOeufs extends StatefulWidget {
  const StockOeufs();

  @override
  _StockOeufsState createState() => _StockOeufsState();
}

class _StockOeufsState extends State<StockOeufs> with TickerProviderStateMixin {
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
          onTap: () => Get.to(() => VoirFicheOeufs()),
        ),
        SpeedDialChild(
          child: Icon(Icons.tune),
          backgroundColor: Colors.blue,
          label: 'Réajustement',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => ReajustementOeufs()),
        ),
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          label: 'Nouvelle collecte',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => CollecteOeufs()),
        ),
      ],
    );
  }

  int touchedIndex = 0;

  int lastPanStartOnIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
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
                              Text("Petits"),
                              Container(
                                height: 1,
                                color: Colors.black,
                              ),
                              Text("1240"),
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
                              Text("5040"),
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
                              Text("4000"),
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
              Container(
                height: MediaQuery.of(context).size.width * 0.5,
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 35,
                    sectionsSpace: 0.9,
                    pieTouchData:
                        PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        final desiredTouch =
                            pieTouchResponse.touchInput is! PointerExitEvent &&
                                pieTouchResponse.touchInput is! PointerUpEvent;
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
              ),
              Container(
                child: Center(
                  child: Text("Historique des collections"),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, i) => ItemStockOeufs(),
          ),
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
            color: const Color(0xff0293ee),
            value: 1240,
            title: '1240\nPetits',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 5040,
            title: '5040\nMoyens',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 4000,
            title: '4000\nGrands',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
