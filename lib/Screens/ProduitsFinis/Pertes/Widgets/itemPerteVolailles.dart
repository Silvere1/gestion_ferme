import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/perteController.dart';

class ItemPerteVolailles extends StatelessWidget {
  const ItemPerteVolailles(this.controller, this.i);
  final PerteController controller;
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
                      "Perte Volailles N°: ${controller.listPerteVolailles[i].num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Déclarée le ${controller.listPerteVolailles[i].dateTime.day}/"
                      "${controller.listPerteVolailles[i].dateTime.month}/"
                      "${controller.listPerteVolailles[i].dateTime.year}",
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
                    Text("${controller.listPerteVolailles[i].qte}")
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "Motif : ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text("${controller.listPerteVolailles[i].motif}")
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
