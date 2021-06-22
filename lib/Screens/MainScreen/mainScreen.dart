import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/screenSizeController.dart';
import 'package:gestionferme/Screens/DashBoard/dashBoard.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/approvisionnements.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/consommations.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Lots/lots.dart';
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
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MenuController menuController = Get.put(MenuController());

  List<Widget> _myWidgets = [
    DashBoard(),
    Lots(),
    Approvisionnements(),
    Consommations(),
    ListCollecteOeuf(),
    Ventes(),
    Pertes(),
    Usages(),
    StockMatieresPremieres(),
    StockProduitsFinis(),
    Archives(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(menuController.tolBarTitle.value)),
          centerTitle: true,
          elevation: 0,
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
    );
  }
}
