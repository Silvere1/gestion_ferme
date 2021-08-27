import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/listProvendeDialog.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Widgets/itemEditProvende.dart';
import 'package:get/get.dart';

class NewReajustementProvende extends StatefulWidget {
  const NewReajustementProvende();

  @override
  _NewReajustementProvendeState createState() =>
      _NewReajustementProvendeState();
}

class _NewReajustementProvendeState extends State<NewReajustementProvende> {
  EditStockController controller = Get.find();
  var textC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          title: Text("Nouvel réajustement Provende"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
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
                              controller.valQteProv.value = "";
                              showDialog(
                                  context: context,
                                  builder: (_) => ListProvendeDialog());
                            },
                            child: Text("Sélectionner une provende"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Obx(() => controller.itemProvende.length != 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.itemProvende.length,
                          itemBuilder: (_, i) => ItemEditProvende(i, textC))
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
                      onPressed: controller.valQteProv.value != "" &&
                              controller.itemProvende.length != 0
                          ? () async {
                              controller.saveEditStockprovende();
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
