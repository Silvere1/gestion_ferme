import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/venteController.dart';

class ItemVenteOeufs extends StatelessWidget {
  const ItemVenteOeufs(this.controller, this.i);
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
                      "Vente Oeufs N°: ${controller.listVenteOeufs[i].num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Effectuée le ${controller.listVenteOeufs[i].dateTime.day}/${controller.listVenteOeufs[i].dateTime.month}/${controller.listVenteOeufs[i].dateTime.year}",
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
                        Text("${controller.listVenteOeufs[i].petits}"),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Moyens : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("${controller.listVenteOeufs[i].moyens}"),
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
                        Text("${controller.listVenteOeufs[i].grands}"),
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
                            "${controller.listVenteOeufs[i].petits + controller.listVenteOeufs[i].moyens + controller.listVenteOeufs[i].grands}"),
                      ],
                    )),
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
                    Text("${controller.listVenteOeufs[i].montant.round()} Fcfa")
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
