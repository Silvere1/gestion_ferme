import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/consomProdTraiteModel.dart';

class ItemConsProdTraite extends StatelessWidget {
  const ItemConsProdTraite(this.consomProdTraite);
  final ConsomProdTraite consomProdTraite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
        borderRadius: BorderRadius.circular(5),
        elevation: 0.9,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          splashColor: Theme.of(context).primaryColor,
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Traitement N°: ${consomProdTraite.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Effectué le ${consomProdTraite.dateTime.day}/"
                      "${consomProdTraite.dateTime.month}/"
                      "${consomProdTraite.dateTime.year}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "Lot N° : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${consomProdTraite.lot.num}")
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "Produit : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${consomProdTraite.produit.nom}")
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "Quantité : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                        "${consomProdTraite.qte} ${consomProdTraite.produit.unite}")
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
