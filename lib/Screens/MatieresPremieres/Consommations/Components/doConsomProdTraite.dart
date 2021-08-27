import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:get/get.dart';

class DoConsomProdTraite extends StatefulWidget {
  const DoConsomProdTraite(this.produit, this.pageController);
  final Produit produit;
  final PageController pageController;
  @override
  _DoConsomProdTraiteState createState() =>
      _DoConsomProdTraiteState(produit, pageController);
}

class _DoConsomProdTraiteState extends State<DoConsomProdTraite> {
  AddLotController lotController = Get.find();
  ConsommationController controller = Get.find();
  final Produit produit;
  final PageController pageController;

  _DoConsomProdTraiteState(this.produit, this.pageController);
  bool all = false;

  @override
  void initState() {
    super.initState();
    controller.recuperateProduit(produit);
    /* getLots();*/
  }

  /*getLots() {
    lotController.getListLots();
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              produit.nom.toString() + " ${produit.qte}" + " ${produit.unite}"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              width: Get.width,
              color: Color(0xfffafafa),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 26),
                    child: Checkbox(
                      value: all,
                      onChanged: (value) async {
                        all = value!;
                        lotController.listlot.forEach((e) {
                          e.select = value;
                        });
                        setState(() {});
                        if (value) {
                          await controller
                              .getAllItemConsProd(lotController.listlot);
                        } else {
                          await controller.deletAllItem();
                        }
                        await controller.validateConsProd();
                      },
                    ),
                  ),
                  Text("Sélectionner tout"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(right: 16),
                      child: Obx(() => ElevatedButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime(2020),
                                lastDate: DateTime.now(),
                                initialDate: DateTime.now(),
                              ).then((DateTime? value) => {
                                    if (value != null)
                                      controller
                                          .getDate(value.toIso8601String()),
                                  });
                            },
                            child: Text(controller.date.value),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => lotController.listlot.length != 0
                    ? ListView.builder(
                        itemCount: lotController.listlot.length,
                        itemBuilder: (context, i) => Container(
                          margin: EdgeInsets.only(top: 6, left: 10, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            elevation: 2,
                            child: Obx(() => CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  value: lotController.listlot[i].select,
                                  onChanged: (value) async {
                                    lotController.listlot[i].select = value!;
                                    setState(() {});
                                    if (lotController.listlot[i].select) {
                                      await controller.getItemConsProd(
                                          lotController.listlot[i]);
                                    } else {
                                      await controller.deleteItemConsProd(
                                          lotController.listlot[i]);
                                    }
                                    await controller.validateConsProd();
                                  },
                                  title: Container(
                                    child: Container(
                                      height: 60,
                                      constraints: BoxConstraints(),
                                      padding: EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          left: 18,
                                          right: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                  "Lot N°: ${lotController.listlot[i].num}")),
                                          lotController.listlot[i].select
                                              ? Text("Qté : ")
                                              : Container(),
                                          lotController.listlot[i].select
                                              ? Expanded(
                                                  flex: 1,
                                                  child: TextFormField(
                                                    onChanged: (value) async {
                                                      if (value
                                                          .trim()
                                                          .isNotEmpty)
                                                        controller
                                                            .produitQteEditing(
                                                                double.parse(
                                                                    value),
                                                                lotController
                                                                    .listlot[i]);
                                                      if (value.trim().isEmpty)
                                                        controller
                                                            .produitQteEditing(
                                                                0,
                                                                lotController
                                                                    .listlot[i]);
                                                      await controller
                                                          .validateConsProd();
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      isCollapsed: true,
                                                      contentPadding:
                                                          EdgeInsets.all(10),
                                                      filled: true,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                            "Vous ne disposez d'aucun lot pour l'instant !"),
                      ),
              ),
            ),
            Container(
              height: 80,
              constraints: BoxConstraints(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: Get.width - 50,
                    child: Obx(() => ElevatedButton(
                          onPressed: controller.isValideConsProd.value &&
                                  controller.date.value != "Date" &&
                                  controller.newListConsomProduit.length > 0
                              ? () async {
                                  await controller.saveConsProduit();
                                  lotController.listlot.forEach((e) {
                                    e.select = false;
                                  });
                                  pageController.previousPage(
                                      duration: Duration(microseconds: 1),
                                      curve: Curves.easeOutBack);
                                  Get.back();
                                  /*Get.defaultDialog(
                                    title: "Succès",
                                    content: Text("Données enregistrées !"),
                                    radius: 5,
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            pageController.previousPage(
                                                duration:
                                                    Duration(microseconds: 1),
                                                curve: Curves.easeOutBack);
                                            Get.back();
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
            )
          ],
        ),
      ),
    );
  }
}
