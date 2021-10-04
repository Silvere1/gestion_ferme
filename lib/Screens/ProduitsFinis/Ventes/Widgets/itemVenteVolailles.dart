import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/venteVolaillesModel.dart';

class ItemVenteVolailles extends StatelessWidget {
  const ItemVenteVolailles(this.venteVolailles);
  final VenteVolailles venteVolailles;

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
          borderRadius: BorderRadius.circular(6),
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
                      "Vente Volailles N°: ${venteVolailles.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Effectuée le ${venteVolailles.dateTime.day}/"
                      "${venteVolailles.dateTime.month}/"
                      "${venteVolailles.dateTime.year}",
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
                    Text("${venteVolailles.qte}")
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "Vendus à : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${venteVolailles.montant.round()} fcfa")
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Client : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${venteVolailles.clientName}")
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
