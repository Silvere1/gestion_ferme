import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:get/get.dart';

class ItemOeufCollection extends StatefulWidget {
  ItemOeufCollection(this.i);
  final int i;

  @override
  _ItemOeufCollectionState createState() => _ItemOeufCollectionState(i);
}

class _ItemOeufCollectionState extends State<ItemOeufCollection> {
  CollecteOeufsController controller = Get.find();
  final int i;

  _ItemOeufCollectionState(this.i);

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
                      "Collecte N°: ${controller.listCollecteOuf[i].num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Collecté le ${controller.listCollecteOuf[i].dateTime.day}/${controller.listCollecteOuf[i].dateTime.month}/${controller.listCollecteOuf[i].dateTime.year}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "Effectuée sur le lot n°: ${controller.listCollecteOuf[i].lot.num}"),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Petits : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("${controller.listCollecteOuf[i].petits}"),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Moyens : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("${controller.listCollecteOuf[i].moyens}"),
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
                        Text("${controller.listCollecteOuf[i].grands}"),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Fêlés : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("${controller.listCollecteOuf[i].feles}"),
                      ],
                    )),
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
