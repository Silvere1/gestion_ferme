import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';

class ItemUsageVolailles extends StatelessWidget {
  const ItemUsageVolailles(this.controller, this.i);
  final UsageController controller;
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
                      "Usage Volailles N°: ${controller.listUsageVolailles[i].num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Déclaré le ${controller.listUsageVolailles[i].dateTime.day}/"
                      "${controller.listUsageVolailles[i].dateTime.month}/"
                      "${controller.listUsageVolailles[i].dateTime.year}",
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
                    Text("${controller.listUsageVolailles[i].qte}")
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
                    Text("${controller.listUsageVolailles[i].motif}")
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
