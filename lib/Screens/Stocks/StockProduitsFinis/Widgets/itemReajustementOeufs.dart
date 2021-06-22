import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/editStockOeufModel.dart';

class ItemReajustementOeufs extends StatelessWidget {
  const ItemReajustementOeufs(this.i);
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
                      "Réajustement N°: ${editstockoeuf[i].num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${editstockoeuf[i].isadd ? "Ajouté" : "Extrait"}" +
                          " le ${editstockoeuf[i].dateTime.day}/${editstockoeuf[i].dateTime.month}/${editstockoeuf[i].dateTime.year}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Petits : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("${editstockoeuf[i].petits}"),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Moyens : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("${editstockoeuf[i].moyens}"),
                      ],
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Grands : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("${editstockoeuf[i].grands}"),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Total : ",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(
                            "${editstockoeuf[i].petits + editstockoeuf[i].moyens + editstockoeuf[i].grands}"),
                      ],
                    )),
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
