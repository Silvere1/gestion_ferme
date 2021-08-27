import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/usageVolaillesModel.dart';

class ItemUsageVolailles extends StatelessWidget {
  const ItemUsageVolailles(this.usedVolailles);
  final UsedVolailles usedVolailles;

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
                      "Consommation N°: ${usedVolailles.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Déclaré le ${usedVolailles.dateTime.day}/"
                      "${usedVolailles.dateTime.month}/"
                      "${usedVolailles.dateTime.year}",
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
                      "Quantité : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${usedVolailles.qte}")
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text(
                      "Motif : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${usedVolailles.motif}")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
