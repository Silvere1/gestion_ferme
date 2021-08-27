import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/approProduitModel.dart';

class ItemApproProduit extends StatelessWidget {
  const ItemApproProduit(this.approProduit);
  final ApproProduit approProduit;

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
        shadowColor: Colors.black,
        elevation: 0.9,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              /*border: Border.all(color: Theme.of(context).primaryColor),*/
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Appro N°${approProduit.num}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Effectué le ${approProduit.createAt.day}/"
                      "${approProduit.createAt.month}/${approProduit.createAt.year}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "${approProduit.produit.nom}",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Qte : ${approProduit.qte} ${approProduit.produit.unite}"),
                    Text("Prix : ${approProduit.value} fcfa"),
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
