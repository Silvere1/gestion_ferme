import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';

class LotItem extends StatelessWidget {
  LotItem(this.i, this.controller);
  final int i;
  final AddLotController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 10, right: 10),
      height: 80,
      child: Material(
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 0.9,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Lot N° : ${controller.listlot[i].num}"),
                Text(
                    "Nombre de volailles : ${controller.listlot[i].nmbrVolauillles}"),
                Text("Âge : ${controller.listlot[i].age} " + "jours"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
