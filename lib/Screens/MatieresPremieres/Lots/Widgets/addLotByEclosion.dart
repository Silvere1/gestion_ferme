import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:get/get.dart';

class AddLotByEclosion extends StatefulWidget {
  AddLotByEclosion();

  @override
  _AddLotByEclosionState createState() => _AddLotByEclosionState();
}

class _AddLotByEclosionState extends State<AddLotByEclosion> {
  AddLotController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 16, left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Rensigner le nombre d'oeufs éclores."),
                    ),
                    Container(
                      height: 70,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text("Nombre de petits"),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Obx(() => TextFormField(
                                  onChanged: (value) async {
                                    if (value.trim().isNotEmpty)
                                      await controller
                                          .nmbrPetitsEditing(int.parse(value));
                                    if (value.trim().isEmpty)
                                      await controller.nmbrPetitsEditing(0);
                                    await controller.validateMe();
                                  },
                                  keyboardType: TextInputType.number,
                                  enabled: controller.stockOeuf.petits > 0
                                      ? true
                                      : false,
                                  decoration: InputDecoration(
                                    isCollapsed: true,
                                    contentPadding: EdgeInsets.all(10),
                                    filled: true,
                                    errorText: controller.erro1.value
                                        ? controller.invalide1.value
                                            ? "valeur invalide !"
                                            : "doit être >= 0 et <= ${controller.stockOeuf.petits}"
                                        : null,
                                    errorStyle: TextStyle(height: 0),
                                    hintText: "${controller.stockOeuf.petits}",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text("Nombre de moyens"),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Obx(() => TextFormField(
                                  onChanged: (value) async {
                                    if (value.trim().isNotEmpty)
                                      await controller
                                          .nmbrMoyensEditing(int.parse(value));
                                    if (value.trim().isEmpty)
                                      await controller.nmbrMoyensEditing(0);
                                    await controller.validateMe();
                                  },
                                  keyboardType: TextInputType.number,
                                  enabled: controller.stockOeuf.moyens > 0
                                      ? true
                                      : false,
                                  decoration: InputDecoration(
                                    isCollapsed: true,
                                    contentPadding: EdgeInsets.all(10),
                                    filled: true,
                                    errorText: controller.erro2.value
                                        ? controller.invalide2.value
                                            ? "valeur invalide !"
                                            /*: controller.stockOeuf.moyens == 0
                                                ? "le stock est vide !"*/
                                            : "doit être <= ${controller.stockOeuf.moyens}"
                                        : null,
                                    errorStyle: TextStyle(height: 0),
                                    hintText: "${controller.stockOeuf.moyens}",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text("Nombre de grands"),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Obx(() => TextFormField(
                                  onChanged: (value) async {
                                    if (value.trim().isNotEmpty)
                                      await controller
                                          .nmbrGrandsEditing(int.parse(value));
                                    if (value.trim().isEmpty)
                                      await controller.nmbrGrandsEditing(0);
                                    await controller.validateMe();
                                  },
                                  keyboardType: TextInputType.number,
                                  enabled: controller.stockOeuf.grands > 0
                                      ? true
                                      : false,
                                  decoration: InputDecoration(
                                    isCollapsed: true,
                                    contentPadding: EdgeInsets.all(10),
                                    filled: true,
                                    errorText: controller.erro3.value
                                        ? controller.invalide3.value
                                            ? "valeur invalide !"
                                            /*: controller.stockOeuf.grands == 0
                                                ? "le stock est vide "*/
                                            : "doit être >= 0 et <= ${controller.stockOeuf.grands}"
                                        : null,
                                    errorStyle: TextStyle(height: 0),
                                    hintText: "${controller.stockOeuf.grands}",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text("Date d'éclosion"),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Obx(() => TextFormField(
                                    focusNode: FocusNode(),
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime.now(),
                                        initialDate: DateTime.now(),
                                      ).then((DateTime? value) => {
                                            if (value != null)
                                              controller.getDate1(
                                                  value.toIso8601String()),
                                          });
                                    },
                                    decoration: InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.all(10),
                                      filled: true,
                                      hintText: "${controller.date1.value}",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      width: Get.width - 28,
                      margin: EdgeInsets.only(bottom: 20, top: 16),
                      child: Obx(() => ElevatedButton(
                            onPressed: (controller.nombreP.value +
                                            controller.nombreM.value +
                                            controller.nombreG.value) >
                                        0 &&
                                    controller.date1.value != "Date" &&
                                    controller.isValidate.value
                                ? () async {
                                    await controller.addLotTypeOne();
                                    Get.back();
                                  }
                                : null,
                            child: Text("Enregistrer"),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
