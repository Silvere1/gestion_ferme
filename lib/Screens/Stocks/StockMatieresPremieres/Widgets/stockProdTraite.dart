import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/stockApproProdTraite.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/stockConsomProdTraite.dart';
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
          onTap: () => print('FIRST CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.remove),
          backgroundColor: Colors.blue,
          label: 'Consommation',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => StockConsomProdTraite()),
        ),
        SpeedDialChild(
          child: Icon(Icons.local_grocery_store),
          backgroundColor: Colors.blue,
          label: 'Approvisionnement',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => Get.to(() => StockApproProdTraite()),
        ),
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
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
      body: Column(
        children: [
          Container(
            height: 50,
            width: Get.width,
            color: Color(0xfffafafa),
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
            child: ListView.builder(
                controller: scrollController,
                itemCount: produits.length,
                itemBuilder: (context, i) => ItemProdTraite(i)),
          ),
        ],
      ),
      floatingActionButton: buildFloatingButton(),
    );
  }
}
