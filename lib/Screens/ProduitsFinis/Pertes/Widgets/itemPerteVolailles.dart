import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/perteVolaillesModel.dart';

class ItemPerteVolailles extends StatelessWidget {
  const ItemPerteVolailles(this.perteVolailles);
  final PerteVolailles perteVolailles;

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
                      "Perte Volailles N°: ${perteVolailles.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Déclarée le ${perteVolailles.dateTime.day}/"
                      "${perteVolailles.dateTime.month}/"
                      "${perteVolailles.dateTime.year}",
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
                      "Quantité : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${perteVolailles.qte}")
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
                    Text("${perteVolailles.motif}")
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
