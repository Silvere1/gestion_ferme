import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/perteController.dart';
import 'package:gestionferme/Screens/ProduitsFinis/Pertes/Components/listLotsDialog.dart';
import 'package:get/get.dart';

import 'itemPerte.dart';

class NewPerteVolailles extends StatefulWidget {
  const NewPerteVolailles(this.pageController);
  final PageController pageController;

  @override
  _NewPerteVolaillesState createState() =>
      _NewPerteVolaillesState(pageController);
}

class _NewPerteVolaillesState extends State<NewPerteVolailles> {
  PerteController controller = Get.find();
  final PageController pageController;

  _NewPerteVolaillesState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 4),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOutBack);
                  },
                  icon: Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            height: 40,
            width: Get.width - 40,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ListLotsDialog();
                    });
              },
              child: Text("Sélectionner le lot"),
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.itemPerte.length != 0
                  ? ListView.builder(
                      itemCount: controller.itemPerte.length,
                      itemBuilder: (context, i) => ItemPerte(i))
                  : Center(
                      child: Text("Sélectionner un lot"),
                    ),
            ),
          ),
          Container(
            height: 70,
            constraints: BoxConstraints(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: Get.width - 50,
                  child: Obx(() => ElevatedButton(
                        onPressed: controller.qteVolaille.value > 0 &&
                                controller.vMotif.value != ""
                            ? () async {
                                await controller.savePerteVolaille();
                                FocusScope.of(context).unfocus();
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeOutBack);
                                /* Get.defaultDialog(
                        title: "Succès",
                        content: Text("Données enregistrées !"),
                        radius: 5,
                        actions: [
                          ElevatedButton(
                              onPressed: () {

                                Get.back();
                              },
                              child: Text("Ok"))
                        ],
                      );*/
                              }
                            : null,
                        child: Text("Enregistrer"),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
