import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/Screens/DashBoard/Components/newCollecte.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/approvisionnements.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Lots/lots.dart';
import 'package:get/get.dart';

class DashBoard extends StatefulWidget {
  const DashBoard();

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  AddLotController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getData(),
        builder: (_, snapshot) {
          return snapshot.hasData
              ? SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffe5e5e5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Détail Volailles",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    /*border: Border.all(color: Colors.black26),*/
                                    /*boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 1,
                                        spreadRadius: 0.1,
                                      )
                                    ],*/
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    /*color: Color(0xffBDD1C7),*/
                                    color: Theme.of(context).primaryColor,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      /*splashColor:
                                          Theme.of(context).primaryColor,*/
                                      onTap: () {
                                        Get.to(() => Lots());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                /*height: 40,*/
                                                /*child: SvgPicture.asset(
                                                "assets/icons/baby_chick.svg",
                                                height: 40,
                                              ),*/
                                                ),
                                            Container(
                                              child: Icon(Icons.add,
                                                  size: 26,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Volailles",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /* border: Border.all(
                                    color: Theme.of(context).primaryColor),*/
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 1,
                                    spreadRadius: 0.1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 8),
                                    height: 40,
                                    width: 40,
                                    child: SvgPicture.asset(
                                      "assets/icons/farm_house.svg",
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        Obx(() => Text(controller
                                                    .totalVolailles.value >
                                                1
                                            ? "${controller.totalVolailles} volailles"
                                            : "${controller.totalVolailles} volaille")),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Obx(() => Text(
                                          controller.listlot.length > 1
                                              ? "${controller.listlot.length} Lots"
                                              : "${controller.listlot.length} Lot",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /*border: Border.all(
                                    color: Theme.of(context).primaryColor),*/
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 1,
                                    spreadRadius: 0.1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 8),
                                    height: 40,
                                    width: 40,
                                    child: SvgPicture.asset(
                                      "assets/icons/hatching_chick.svg",
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(() => Text(
                                              controller.allVoByAge1.value > 1
                                                  ? "${controller.allVoByAge1} Poussins"
                                                  : "${controller.allVoByAge1} Poussin",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            )),
                                        Text("0 à 8 semaines"),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Obx(() => Text(
                                          controller.lotsAge1 > 1
                                              ? "${controller.lotsAge1} Lots"
                                              : "${controller.lotsAge1} Lot",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /* border: Border.all(
                                    color: Theme.of(context).primaryColor),*/
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 1,
                                    spreadRadius: 0.1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.all(7),
                                    height: 40,
                                    width: 40,
                                    child: SvgPicture.asset(
                                      "assets/icons/chickenm.svg",
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(() => Text(
                                              controller.allVoByAge2.value > 1
                                                  ? "${controller.allVoByAge2} Poulettes"
                                                  : "${controller.allVoByAge2} Poulette",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            )),
                                        Text("8 à 20 semaines"),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Obx(() => Text(
                                          controller.lotsAge2 > 1
                                              ? "${controller.lotsAge2} Lots"
                                              : "${controller.lotsAge2} Lot",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                /*border: Border.all(color: Colors.black26),*/
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 1,
                                    spreadRadius: 0.1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 8),
                                    height: 40,
                                    width: 40,
                                    child: SvgPicture.asset(
                                      "assets/icons/chicken.svg",
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(() => Text(
                                              controller.allVoByAge3.value > 1
                                                  ? "${controller.allVoByAge3} Pondeuses"
                                                  : "${controller.allVoByAge3} Pondeuse",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            )),
                                        Text("+20 semaines"),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Obx(() => Text(
                                          controller.lotsAge3 > 1
                                              ? "${controller.lotsAge3} Lots"
                                              : "${controller.lotsAge3} Lot",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffe5e5e5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Détail stockage Oeufs",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    /*border: Border.all(color: Colors.black26),*/
                                    /*boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 1,
                                        spreadRadius: 0.1,
                                      )
                                    ],*/
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    /*color: Color(0xffBDD1C7),*/
                                    color: Theme.of(context).primaryColor,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      /*splashColor:
                                          Theme.of(context).primaryColor,*/
                                      onTap: () {
                                        Get.to(() => NewCollecte());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                /*height: 40,*/
                                                /*child: SvgPicture.asset(
                                                "assets/icons/baby_chick.svg",
                                                height: 40,
                                              ),*/
                                                ),
                                            Container(
                                              child: Icon(Icons.add,
                                                  size: 26,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Oeufs",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 180,
                              child: Stack(
                                children: [
                                  Obx(() => PieChart(
                                        PieChartData(
                                          centerSpaceRadius: 45,
                                          sectionsSpace: 2.9,
                                          startDegreeOffset: 180,
                                          borderData: FlBorderData(
                                            show: false,
                                          ),
                                          sections: showMySections(),
                                        ),
                                        swapAnimationCurve: Curves.linear,
                                        swapAnimationDuration:
                                            Duration(milliseconds: 150),
                                      )),
                                  Positioned.fill(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              height: 0.5),
                                        ),
                                        Obx(() => Text(
                                              "${controller.oeufT}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Color(0xffCE8669),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Expanded(child: Text("Petits")),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Color(0xffCE5E62),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Expanded(child: Text("Moyens")),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: Color(0xff2085E9),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Expanded(child: Text("Grands")),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      /*boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 2.5,
                                          spreadRadius: 0.1,
                                        )
                                      ],*/
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: SvgPicture.asset(
                                            "assets/icons/eggsh.svg",
                                            height: 40,
                                            color: Color(0xffFB9D76),
                                            colorBlendMode: BlendMode.modulate,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Petits",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                            Obx(() => Text(controller
                                                            .oeufP.value %
                                                        30 ==
                                                    0
                                                ? "${controller.oeufP.value ~/ 30}P"
                                                : "${controller.oeufP ~/ 30}P + ${controller.oeufP % 30}o")),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      /*boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 2.5,
                                      spreadRadius: 0.1,
                                    )
                                  ],*/
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: SvgPicture.asset(
                                            "assets/icons/eggsh.svg",
                                            height: 40,
                                            color: Color(0xffF36A6A),
                                            colorBlendMode: BlendMode.modulate,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Moyens",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                            Obx(() => Text(controller
                                                            .oeufM.value %
                                                        30 ==
                                                    0
                                                ? "${controller.oeufM ~/ 30}P"
                                                : "${controller.oeufM ~/ 30}P + ${controller.oeufM % 30}o")),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      /* boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 2.5,
                                          spreadRadius: 0.1,
                                        )
                                      ],*/
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: SvgPicture.asset(
                                            "assets/icons/eggsh.svg",
                                            height: 40,
                                            color: Color(0xff2697FF),
                                            colorBlendMode: BlendMode.modulate,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Grands",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                            Obx(() => Text(controller
                                                            .oeufG.value %
                                                        30 ==
                                                    0
                                                ? "${controller.oeufG ~/ 30}P"
                                                : "${controller.oeufG ~/ 30}P + ${controller.oeufG % 30}o")),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      /* boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 2.5,
                                          spreadRadius: 0.1,
                                        )
                                      ],*/
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: SvgPicture.asset(
                                            "assets/icons/eggsh.svg",
                                            height: 40,
                                            color:
                                                Theme.of(context).primaryColor,
                                            colorBlendMode: BlendMode.modulate,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Total",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                            Obx(() => Text(controller
                                                            .oeufT.value %
                                                        30 ==
                                                    0
                                                ? "${controller.oeufT ~/ 30}P"
                                                : "${controller.oeufT ~/ 30}P + ${controller.oeufT % 30}o")),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              /*border: Border.all(color: Colors.black26),*/
                              /*boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 1,
                                  spreadRadius: 0.1,
                                )
                              ],*/
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              /*color: Color(0xffBDD1C7),*/
                              color: Theme.of(context).primaryColor,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                splashColor: Theme.of(context).primaryColor,
                                onTap: () {
                                  Get.to(() => Approvisionnements());
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 8),
                                        height: 40,
                                        width: 34,
                                        child: SvgPicture.asset(
                                          "assets/icons/appro.svg",
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Approvisionnement",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffe5e5e5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Archives",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                /* boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 2.5,
                                    spreadRadius: 0.1,
                                  )
                                ],*/
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 8),
                                    height: 40,
                                    width: 40,
                                    child: SvgPicture.asset(
                                      "assets/icons/farm_house.svg",
                                      colorBlendMode: BlendMode.modulate,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Lots archivés",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        Text(controller.archiveListLot.length >
                                                1
                                            ? "${controller.archiveListLot.length} lots"
                                            : "${controller.archiveListLot.length} lot"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*ElevatedButton(
                          onPressed: () async {
                            //DataBaseProvider.instance.deleteDataBase();
                            await DataBaseProvider.instance.updateCollecte();
                          },
                          child: Text("Ok"))*/
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  List<PieChartSectionData> showMySections() {
    return List.generate(3, (i) {
      /*final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 18.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;*/
      final fontSize = 12.0;
      final radius = 40.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xffCE8669),
            value: controller.oeufP.toDouble() + 1,
            title: '${controller.oeufP}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xffCE5E62),
            value: controller.oeufM.toDouble() + 1,
            title: '${controller.oeufM}',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xff2085E9),
            value: controller.oeufG.toDouble() + 1,
            title: '${controller.oeufG}',
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
