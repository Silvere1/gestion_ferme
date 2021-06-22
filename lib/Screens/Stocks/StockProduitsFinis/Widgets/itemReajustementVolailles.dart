import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/editStockVolailleModel.dart';

class ItemReajustementVolailles extends StatelessWidget {
  const ItemReajustementVolailles(this.i);
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 2,
        child: InkWell(
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
                      "Réajustement N°: ${editstockvolailles[i].num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${editstockvolailles[i].isadd ? "Ajouté" : "Extrait"}" +
                          " le ${editstockvolailles[i].dateTime.day}/${editstockvolailles[i].dateTime.month}/${editstockvolailles[i].dateTime.year}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Effectué sur le lot : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${editstockvolailles[i].lot.num}"),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Quantité : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${editstockvolailles[i].qte}"),
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
