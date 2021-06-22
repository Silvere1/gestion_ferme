import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Components/voirFicheLot.dart';
import 'package:get/get.dart';

class ItemStockVolailles extends StatefulWidget {
  const ItemStockVolailles(this.i);
  final int i;

  @override
  _ItemStockVolaillesState createState() => _ItemStockVolaillesState(i);
}

class _ItemStockVolaillesState extends State<ItemStockVolailles> {
  final int i;

  _ItemStockVolaillesState(this.i);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 10, right: 10),
      child: Material(
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 0.9,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            Get.to(() => VoirFicheLot(lots[i]));
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Lot N° : ${lots[i].num}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text("Nombre de volailles : ${lots[i].nmbrVolauillles}"),
                Text("Âge : ${lots[i].age} " + "jours"),
                Text("Taux de mortalité : 0%"),
                Text("Taux de ponte : 0%"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
