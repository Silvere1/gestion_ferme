import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/lotModel.dart';

class LotItem extends StatelessWidget {
  LotItem(this.lot);
  final Lot lot;

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
      height: 80,
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
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 18, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lot N° : ${lot.num}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      lot.type == 0
                          ? "éclore le ${lot.buyAt.day}/${lot.buyAt.month}/${lot.buyAt.year}"
                          : "achetés le ${lot.buyAt.day}/${lot.buyAt.month}/${lot.buyAt.year}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nombre de volailles : ${lot.nmbrVolauillles}"),
                    Text(
                      lot.type == 1 ? "à ${lot.montant} Fcfa" : "",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                    "Âge : ${lot.age + DateTime.now().difference(lot.createAt).inDays} " +
                        "jours"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
