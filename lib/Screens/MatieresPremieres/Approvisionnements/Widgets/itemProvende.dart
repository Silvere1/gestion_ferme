import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';

class ItemProvende extends StatelessWidget {
  ItemProvende(
    this.controller,
    this.i,
    this.pageController,
  );

  final ApproController controller;
  final int i;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 10, right: 10),
      height: 70,
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
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("${controller.listProvendes[i].nom}"),
                      SizedBox(
                        height: 12,
                      ),
                      Text("Qté : ${controller.listProvendes[i].qte}" +
                          " ${controller.listProvendes[i].unite}"),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: IconButton(
                      splashColor: Theme.of(context).primaryColor,
                      onPressed: () async {
                        await controller.moveInstence(i);
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
