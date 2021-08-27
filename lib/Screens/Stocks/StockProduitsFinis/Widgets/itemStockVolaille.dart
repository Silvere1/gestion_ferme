import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Controllers/ficheController.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Components/voirFicheLot.dart';
import 'package:get/get.dart';

import '/App/date.dart';

class ItemStockVolailles extends StatefulWidget {
  const ItemStockVolailles(this.i);
  final int i;

  @override
  _ItemStockVolaillesState createState() => _ItemStockVolaillesState(i);
}

class _ItemStockVolaillesState extends State<ItemStockVolailles> {
  final int i;
  FicheController controller = Get.find();
  AddLotController _lotController = Get.find();

  _ItemStockVolaillesState(this.i);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 10, right: 10),
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
        elevation: 0.9,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
          onTap: () async {
            await controller.recuparateLot(_lotController.listlot[i]);
            Get.to(() => VoirFicheLot(_lotController.listlot[i]));
          },
          child: Container(
            decoration: BoxDecoration(
              /*border: Border.all(color: Theme.of(context).primaryColor),*/
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lot N° : ${_lotController.listlot[i].num}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      _lotController.listlot[i].type == 0
                          ? "éclore le ${_lotController.listlot[i].buyAt.day}/${_lotController.listlot[i].buyAt.month}/${_lotController.listlot[i].buyAt.year}"
                          : "achetés le ${_lotController.listlot[i].buyAt.day}/${_lotController.listlot[i].buyAt.month}/${_lotController.listlot[i].buyAt.year}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Nombre de volailles : ${_lotController.listlot[i].nmbrVolauillles}"),
                    Text(
                      _lotController.listlot[i].type == 1
                          ? "à ${_lotController.listlot[i].montant} Fcfa"
                          : "",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                    "Âge : ${_lotController.listlot[i].age + DateTime.now().difOnlyDay(_lotController.listlot[i].createAt)} " +
                        "jours"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
