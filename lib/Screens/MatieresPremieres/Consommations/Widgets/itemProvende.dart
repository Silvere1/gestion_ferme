import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/Components/doConsomProvende.dart';
import 'package:get/get.dart';

class ItemProvende extends StatelessWidget {
  ItemProvende(this.i);
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 10, right: 10),
      height: 70,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          splashColor: Theme.of(context).primaryColor,
          onTap: () {
            Get.to(() => DoConsomProvende(provendes[i].nom.toString() +
                " ${provendes[i].qte}" +
                " ${provendes[i].unite}"));
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(provendes[i].nom.toString()),
                      Text("Qté : ${provendes[i].qte}" +
                          " ${provendes[i].unite}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
