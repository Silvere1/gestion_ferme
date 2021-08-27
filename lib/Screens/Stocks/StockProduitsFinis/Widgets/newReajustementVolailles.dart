import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Components/listLotDialog.dart';
import 'package:get/get.dart';

import 'itemLotEdit.dart';

class NewReajustementVolailles extends StatefulWidget {
  const NewReajustementVolailles();

  @override
  _NewReajustementVolaillesState createState() =>
      _NewReajustementVolaillesState();
}

class _NewReajustementVolaillesState extends State<NewReajustementVolailles> {
  EditStockController controller = Get.find();
  var textC = TextEditingController();
  /*bool uni = true;
  bool plus = false;*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          title: Text("Nouvelle réajustements Volailles"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              padding:
                  EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () async {
                              textC.clear();
                              controller.valNmbrV.value = "";
                              showDialog(
                                  context: context,
                                  builder: (_) => ListLotsDialog());
                            },
                            child: Text("Sélectionner un lot"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Obx(() => controller.itemLot.length != 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.itemLot.length,
                          itemBuilder: (_, i) => ItemLotEdit(i, textC))
                      : Center()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: 40,
                width: Get.width - 40,
                child: Obx(() => ElevatedButton(
                      onPressed: controller.valNmbrV.value != "" &&
                              controller.itemLot.length != 0
                          ? () async {
                              controller.saveEditStockVolaille();
                              Get.back();
                            }
                          : null,
                      child: Text("Enregistrer"),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
