import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/venteController.dart';
import 'package:gestionferme/Screens/ProduitsFinis/Ventes/Components/listLotsDialog.dart';
import 'package:get/get.dart';

import 'itemLotVente.dart';

class NewVenteVolailles extends StatefulWidget {
  const NewVenteVolailles(this.pageController);
  final PageController pageController;

  @override
  _NewVenteVolaillesState createState() =>
      _NewVenteVolaillesState(pageController);
}

class _NewVenteVolaillesState extends State<NewVenteVolailles> {
  final PageController pageController;
  VenteController controller = Get.find();
  /* bool uni = true;
  bool plus = false;*/

  _NewVenteVolaillesState(this.pageController);
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
          /*Container(
            margin: EdgeInsets.only(top: 6, left: 18, bottom: 4),
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                          value: uni,
                          onChanged: (value) {
                            uni = value!;
                            plus = !uni;
                            controller.plus.value = !uni;
                            controller.itemVolaillesVente.value = [];
                            setState(() {});
                          }),
                      Text("UniLot"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Row(
                    children: [
                      Checkbox(
                          value: plus,
                          onChanged: (value) {
                            plus = value!;
                            uni = !plus;
                            controller.plus.value = value;
                            controller.itemVolaillesVente.value = [];
                            setState(() {});
                          }),
                      Text("Plusieurs Lots"),
                    ],
                  ),
                ),
              ],
            ),
          ),*/
          Container(
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
              child: Text("Sélectionner de lots"),
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.itemVolaillesVente.length != 0
                  ? ListView.builder(
                      itemCount: controller.itemVolaillesVente.length,
                      itemBuilder: (context, i) => ItemLotVente(i),
                    )
                  : Center(
                      child:
                          Text("Sélectionner un lot pour effectuer la vente."),
                    ),
            ),
          ),
          Container(
            height: 120,
            constraints: BoxConstraints(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*Obx(() => controller.plus.value &&
                        controller.itemVolaillesVente.length != 0
                    ? Container(
                        width: Get.width - 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total : XXX"),
                            Container(
                              height: 45,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Text("Montant"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 16),
                                      onChanged: (value) {
                                        //controller.nmbrEditing(int.parse(value));
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container()),*/
                Container(
                  height: 40,
                  width: Get.width - 50,
                  child: Obx(() => ElevatedButton(
                        onPressed: controller.newListVenteVolailles.length !=
                                    0 &&
                                controller.erroMontant
                                    .every((e) => e == false) &&
                                controller.erroQte.every((e) => e == false) &&
                                controller.newListVenteVolailles
                                    .every((e) => e.montant > 0)
                            ? () async {
                                await controller.saveVenteVolailles();
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
                                          controller.itemVolaillesVente.value =
                                              [];

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
