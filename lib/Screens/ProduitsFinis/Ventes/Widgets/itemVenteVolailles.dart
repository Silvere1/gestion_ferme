import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/venteController.dart';

class ItemVenteVolailles extends StatelessWidget {
  const ItemVenteVolailles(this.controller, this.i);
  final VenteController controller;
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
                      "Vente Volailles N°: ${controller.listVenteVolailles[i].num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Effectuée le ${controller.listVenteVolailles[i].dateTime.day}/"
                      "${controller.listVenteVolailles[i].dateTime.month}/"
                      "${controller.listVenteVolailles[i].dateTime.year}",
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
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text("${controller.listVenteVolailles[i].qte}")
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "Vendus à : ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                        "${controller.listVenteVolailles[i].montant.round()} Fcfa")
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
