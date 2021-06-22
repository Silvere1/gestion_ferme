import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';

class ItemUsageOeufs extends StatelessWidget {
  const ItemUsageOeufs(this.controller, this.i);
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
                      "Usage Oeufs N°: ${controller.listUsageOeufs[i].num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Déclaré le ${controller.listUsageOeufs[i].dateTime.day}/"
                      "${controller.listUsageOeufs[i].dateTime.month}/"
                      "${controller.listUsageOeufs[i].dateTime.year}",
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
                        Text("${controller.listUsageOeufs[i].petits}"),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Moyens : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("${controller.listUsageOeufs[i].moyens}"),
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
                        Text("${controller.listUsageOeufs[i].grands}"),
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
                            "${controller.listUsageOeufs[i].petits + controller.listUsageOeufs[i].moyens + controller.listUsageOeufs[i].grands}"),
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
                    Text("${controller.listUsageOeufs[i].motif}")
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
