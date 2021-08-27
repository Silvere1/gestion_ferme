import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';
import 'package:gestionferme/Screens/ProduitsFinis/Usages/Components/listLotsDialog.dart';
import 'package:get/get.dart';

import 'itemUsage.dart';

class NewUsageVolailles extends StatefulWidget {
  const NewUsageVolailles(this.pageController);
  final PageController pageController;

  @override
  _NewUsageVolaillesState createState() =>
      _NewUsageVolaillesState(pageController);
}

class _NewUsageVolaillesState extends State<NewUsageVolailles> {
  final PageController pageController;
  UsageController controller = Get.find();

  _NewUsageVolaillesState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 0),
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
              child: Text("Sélectionner de lot"),
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.itemUsage.length != 0
                  ? ListView.builder(
                      itemCount: controller.itemUsage.length,
                      itemBuilder: (context, i) => ItemUsage(i))
                  : Center(
                      child: Text("Sélectionner un lot"),
                    ),
            ),
          ),
          Container(
            height: 80,
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
                                await controller.saveUsedVolaille();
                                FocusScope.of(context).unfocus();
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeOutBack);
                                /*Get.defaultDialog(
                        title: "Succès",
                        content: Text("Données enregistrées !"),
                        radius: 5,
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                controller.itemUsage.value = [];
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
