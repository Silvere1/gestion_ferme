import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/Components/doConsomProdTraite.dart';
import 'package:get/get.dart';

class ItemProdTraite extends StatelessWidget {
  const ItemProdTraite(this.produit, this.pageController);
  final Produit produit;
  final PageController pageController;
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
      height: 70,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        elevation: 0.9,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          splashColor: Theme.of(context).primaryColor,
          onTap: produit.qte > 0
              ? () {
                  Get.to(() => DoConsomProdTraite(produit, pageController));
                }
              : null,
          child: Container(
            decoration: BoxDecoration(
              /*border: Border.all(color: Theme.of(context).primaryColor),*/
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 18),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      produit.nom.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("Qté : ${produit.qte}" + " ${produit.unite}"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
