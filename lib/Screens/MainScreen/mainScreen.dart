import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Controllers/screenSizeController.dart';
import 'package:gestionferme/Screens/Backup/backup.dart';
import 'package:gestionferme/Screens/DashBoard/dashBoard.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/consommations.dart';
import 'package:gestionferme/Screens/ProduitsFinis/CollecteOeufs/listCollecteOeuf.dart';
import 'package:gestionferme/Screens/ProduitsFinis/Pertes/pertes.dart';
import 'package:gestionferme/Screens/ProduitsFinis/Usages/usages.dart';
import 'package:gestionferme/Screens/ProduitsFinis/Ventes/ventes.dart';
import 'package:gestionferme/Screens/Stocks/Archives/archives.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/stockMatierePremieres.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/stockProduitsFinis.dart';
import 'package:get/get.dart';

import 'Components/drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  MenuController menuController = Get.find();
  late AddLotController lotController;

  Future<bool> _onWillPop() async {
    if (_key.currentState!.isDrawerOpen) {
      Get.back();
      return false;
    }
    if (menuController.initialPage.value != 0) {
      menuController.selectedItem(0, 0, 0, "Tableau de bord");
      Get.back();
      return false;
    }
    return await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Container(
              height: 140,
              padding: EdgeInsets.all(18),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Attention",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                    Text("Fermer l'application ?"),
                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                onPressed: () => Get.back(),
                                child: Text("Non"))),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () => exit(0), child: Text("Oui"))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ) ??
        false;
  }

  List<Widget> _myWidgets = [
    DashBoard(),
    Alimantations(),
    ListCollecteOeuf(),
    Pertes(),
    UsagesConsommation(),
    Ventes(),
    StockMatieresPremieres(),
    StockProduitsFinis(),
    Archives(),
    BackupDb(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: SafeArea(
          child: Scaffold(
            key: _key,
            appBar: AppBar(
              title: Obx(() => Text(menuController.tolBarTitle.value)),
              centerTitle: true,
              elevation: 0,
              actions: [
                Obx(() => menuController.initialPage.value == 0
                    ? IconButton(
                        onPressed: () async {
                          lotController = Get.find();
                          Get.to(() => BackupDb())!.then(
                              (value) async => await lotController.getData());
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/data_backup.svg",
                          height: 20,
                          color: Colors.white,
                        ))
                    : Container())
              ],
            ),
            drawer: SideDrawerMenu(menuController),
            /*body: Column(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(child: SideDrawerMenu(menuController)),
          ],
        ),*/
            body: Obx(() => _myWidgets[menuController.initialPage.value]),
          ),
        ),
        onWillPop: _onWillPop);
  }
}
