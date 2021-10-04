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
            margin: EdgeInsets.only(left: 10, top: 4, right: 20, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    controller.clearData();
                    pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOutBack);
                  },
                  icon: Icon(
                    Icons.close,
                  ),
                ),
                Expanded(child: SizedBox()),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 38,
                    child: Obx(() => ElevatedButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                              initialDate: DateTime.now(),
                            ).then((DateTime? value) => {
                                  if (value != null)
                                    controller.getDate(value.toIso8601String()),
                                });
                          },
                          child: Text(controller.date.value),
                        )),
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
                Container(
                  height: 50,
                  width: Get.width - 50,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text("Client"),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          style: TextStyle(fontSize: 16),
                          onChanged: (value) async {
                            await controller.clientNameEditing(value.trim());
                            await controller.validateMe();
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(10),
                            hintText: "Nom du client",
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
                                    .every((e) => e.montant > 0) &&
                                controller.date.value != "Date" &&
                                controller.clientName.value != ""
                            ? () async {
                                await controller.saveVenteVolailles();
                                FocusScope.of(context).unfocus();
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeOutBack);
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
