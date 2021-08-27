import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';

class ItemProvende extends StatelessWidget {
  ItemProvende(
    this.pageController,
    this.provende,
    this.controller,
  );

  final PageController pageController;
  final Provende provende;
  final ApproController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 10, right: 10),
      height: 70,
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
              /*border: Border.all(color: Theme.of(context).primaryColor),*/
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 18),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${provende.nom}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text("Qté : ${provende.qte}" + " ${provende.unite}"),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: IconButton(
                      splashColor: Theme.of(context).primaryColor,
                      onPressed: () async {
                        await controller.recuperateProvende(provende);
                        pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOutCirc);
                      },
                      icon: Icon(Icons.add),
                    ),
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
