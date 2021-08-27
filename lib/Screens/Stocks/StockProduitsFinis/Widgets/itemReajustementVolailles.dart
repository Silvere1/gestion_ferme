import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/editStockVolailleModel.dart';

class ItemReajustementVolailles extends StatelessWidget {
  const ItemReajustementVolailles(this.editStockVolailles);
  final EditStockVolailles editStockVolailles;

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
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 0.9,
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
                      "Réajustement N°: ${editStockVolailles.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "réajusté le ${editStockVolailles.dateTime.day}/${editStockVolailles.dateTime.month}/${editStockVolailles.dateTime.year}",
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
                      "Effectué sur le lot : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${editStockVolailles.lot.num}"),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Quantité : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                        "de ${editStockVolailles.lot.nmbrVolauillles} à ${editStockVolailles.qte}"),
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
