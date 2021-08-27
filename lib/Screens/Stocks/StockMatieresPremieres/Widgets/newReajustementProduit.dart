import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/listProduitDialog.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Widgets/itemEditProduit.dart';
import 'package:get/get.dart';

class NewReajustementProduit extends StatefulWidget {
  const NewReajustementProduit();

  @override
  _NewReajustementProduitState createState() => _NewReajustementProduitState();
}

class _NewReajustementProduitState extends State<NewReajustementProduit> {
  EditStockController controller = Get.find();
  var textC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          title: Text("Nouvel réajustement Produit"),
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
                              controller.valQteProd.value = "";
                              showDialog(
                                  context: context,
                                  builder: (_) => ListProduitDialog());
                            },
                            child: Text("Sélectionner une produit"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Obx(() => controller.itemProduit.length != 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.itemProduit.length,
                          itemBuilder: (_, i) => ItemEditProduit(i, textC))
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
                      onPressed: controller.valQteProd.value != "" &&
                              controller.itemProduit.length != 0
                          ? () async {
                              controller.saveEditStockProduit();
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
