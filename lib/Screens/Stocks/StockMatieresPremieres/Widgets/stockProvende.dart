import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/App/Controllers/proFicheController.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/selectPeriode.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/stockApproProvendes.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/stockConsomProvendes.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Widgets/reajustementStockProvende.dart';
import 'package:get/get.dart';

import 'createProvende.dart';
import 'itemProvende.dart';

class StockProvende extends StatefulWidget {
  const StockProvende();

  @override
  _StockProvendeState createState() => _StockProvendeState();
}

class _StockProvendeState extends State<StockProvende>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  bool dialVisible = true;
  ApproController controller = Get.find();
  ProFicheController _ficheController = Get.find();

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
        /* SpeedDialChild(
          child: Icon(Icons.visibility),
          backgroundColor: Colors.red,
          label: 'Voir fiche',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('FIRST CHILD'),
        ),*/
        SpeedDialChild(
          child: Icon(Icons.visibility),
          backgroundColor: Colors.white,
          label: 'Voir fiche',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => _ficheController.listProd.length != 0 ||
                  _ficheController.listProv.length != 0
              ? showDialog(context: context, builder: (_) => SelectePeriode())
              : Get.snackbar("Attention !", "Vous ne disposez d'aucune donnée.",
                  duration: Duration(seconds: 5), colorText: Colors.white),
        ),
        SpeedDialChild(
          child: Icon(Icons.tune),
          backgroundColor: Colors.white,
          label: 'Réajustement',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => ReajustementStockProvende()),
        ),
        SpeedDialChild(
          child: Icon(Icons.remove),
          backgroundColor: Colors.white,
          label: 'Consommation',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => StockConsomProvendes()),
        ),
        SpeedDialChild(
          child: Icon(Icons.local_grocery_store),
          backgroundColor: Colors.white,
          label: 'Approvisionnement',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => StockApproProvendes()),
        ),
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
          label: 'Créer',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => CreateProvende()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: Column(
        children: [
           /*
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list),
                ),
                Text("Filtre")
              ],
            ),
          ),*/
          Expanded(
            child: FutureBuilder(
                future: controller.getListProvende(),
                builder: (_, snapshot) {
                  return snapshot.hasData
                      ? Obx(
                          () => controller.listProvendes.length != 0
                              ? ListView.builder(
                                  controller: scrollController,
                                  itemCount: controller.listProvendes.length,
                                  itemBuilder: (context, i) =>
                                      ItemProvende(controller.listProvendes[i]))
                              : Center(
                                  child: Text(
                                  "Aucune provende n'est encore ajoutée !",
                                  textAlign: TextAlign.center,
                                )),
                        )
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
