import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/editStockOeufModel.dart';

class ItemReajustementOeufs extends StatelessWidget {
  const ItemReajustementOeufs(this.editStockOeuf);
  final EditStockOeuf editStockOeuf;

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
                      "Réajustement N°: ${editStockOeuf.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "réajusté le ${editStockOeuf.dateTime.day}/${editStockOeuf.dateTime.month}/${editStockOeuf.dateTime.year}",
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
                          Text("${editStockOeuf.petits}"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Moyens : ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text("${editStockOeuf.moyens}"),
                        ],
                      ),
                    ),
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
                          Text("${editStockOeuf.grands}"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Total : ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                              "${editStockOeuf.petits + editStockOeuf.moyens + editStockOeuf.grands}"),
                        ],
                      ),
                    ),
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
