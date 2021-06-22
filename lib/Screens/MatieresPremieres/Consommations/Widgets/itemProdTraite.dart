import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/Components/doConsomProdTraite.dart';
import 'package:get/get.dart';

class ItemProdTraite extends StatelessWidget {
  const ItemProdTraite(this.i);
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 10, right: 10),
      height: 70,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          splashColor: Theme.of(context).primaryColor,
          onTap: () {
            Get.to(() => DoConsomProdTraite(produits[i].nom.toString() +
                " ${produits[i].qte}" +
                " ${produits[i].unite}"));
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 18),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(produits[i].nom.toString()),
                      Text(
                          "Qté : ${produits[i].qte}" + " ${produits[i].unite}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
