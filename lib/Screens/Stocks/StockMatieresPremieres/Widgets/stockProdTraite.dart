import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/App/Controllers/proFicheController.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/selectPeriode.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/stockApproProdTraite.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/stockConsomProdTraite.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Widgets/reajustementStockProduit.dart';
import 'package:get/get.dart';

import 'createProdTraite.dart';
import 'itemProdTraite.dart';

class StockProTraite extends StatefulWidget {
  const StockProTraite();

  @override
  _StockProTraiteState createState() => _StockProTraiteState();
}

class _StockProTraiteState extends State<StockProTraite>
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
        /*SpeedDialChild(
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
          onTap: () => Get.to(() => ReajustementStockProduit()),
        ),
        SpeedDialChild(
          child: Icon(Icons.remove),
          backgroundColor: Colors.white,
          label: 'Consommation',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => StockConsomProdTraite()),
        ),
        SpeedDialChild(
          child: Icon(Icons.local_grocery_store),
          backgroundColor: Colors.white,
          label: 'Approvisionnement',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => StockApproProdTraite()),
        ),
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
          label: 'Créer',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => CreateProdTraite()),
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
          Container(
            height: 50,
            width: Get.width,
            /*color: Color(0xfffafafa),*/
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list),
                ),
                Text("Filtre")
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: controller.getListProduit(),
                builder: (_, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  return snapshot.hasData
                      ? Obx(
                          () => controller.listProdTraite.length != 0
                              ? ListView.builder(
                                  controller: scrollController,
                                  itemCount: controller.listProdTraite.length,
                                  itemBuilder: (context, i) => ItemProdTraite(
                                      controller.listProdTraite[i]))
                              : Center(
                                  child: Text(
                                  "Aucun produit de traitement n'est encore ajouté !",
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
