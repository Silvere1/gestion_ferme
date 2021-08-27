import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/Components/doConsomProvende.dart';
import 'package:get/get.dart';

class ItemProvende extends StatelessWidget {
  ItemProvende(this.provende, this.controller, this.pageController);
  final Provende provende;
  final ConsommationController controller;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 10, right: 10),
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
      height: 70,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        elevation: 0.9,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          splashColor: Theme.of(context).primaryColor,
          onTap: provende.qte > 0
              ? () {
                  controller.recuperateProvende(provende);
                  Get.to(() => DoConsomProvende(provende, pageController));
                }
              : null,
          child: Container(
            decoration: BoxDecoration(
              /*border: Border.all(color: Theme.of(context).primaryColor),*/
              borderRadius: BorderRadius.circular(5),
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
                      Text(
                        provende.nom.toString(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("Qté : ${provende.qte}" + " ${provende.unite}"),
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
