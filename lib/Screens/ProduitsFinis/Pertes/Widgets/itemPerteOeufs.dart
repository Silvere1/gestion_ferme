import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/perteController.dart';

class ItemPerteOeufs extends StatelessWidget {
  const ItemPerteOeufs(this.controller, this.i);
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
                      "Perte Oeufs N°: ${controller.listPerteOeufs[i].num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Déclarée le ${controller.listPerteOeufs[i].dateTime.day}/"
                      "${controller.listPerteOeufs[i].dateTime.month}/"
                      "${controller.listPerteOeufs[i].dateTime.year}",
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
                        Text("${controller.listPerteOeufs[i].petits}"),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Moyens : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("${controller.listPerteOeufs[i].moyens}"),
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
                        Text("${controller.listPerteOeufs[i].grands}"),
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
                            "${controller.listPerteOeufs[i].petits + controller.listPerteOeufs[i].moyens + controller.listPerteOeufs[i].grands}"),
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
                      "Motif : ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text("${controller.listPerteOeufs[i].motif}")
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
