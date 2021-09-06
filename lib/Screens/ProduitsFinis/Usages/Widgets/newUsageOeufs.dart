import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';
import 'package:get/get.dart';

class NewUsageOeufs extends StatefulWidget {
  const NewUsageOeufs(this.pageController);
  final PageController pageController;

  @override
  _NewUsageOeufsState createState() => _NewUsageOeufsState(pageController);
}

class _NewUsageOeufsState extends State<NewUsageOeufs> {
  UsageController controller = Get.find();
  final PageController pageController;

  _NewUsageOeufsState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 4, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.date.value = "Date";
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
                                            controller.getDate(
                                                value.toIso8601String()),
                                        });
                                  },
                                  child: Text(controller.date.value),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1,
                          spreadRadius: 0.1,
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      elevation: 0.9,
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 65,
                              margin: EdgeInsets.only(top: 4),
                              padding: EdgeInsets.all(8),
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
                                      child: Text("Petits"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Obx(() => TextFormField(
                                          enabled:
                                              controller.stockOeuf.petits > 0
                                                  ? true
                                                  : false,
                                          style: TextStyle(fontSize: 16),
                                          onChanged: (value) async {
                                            if (value.trim().isNotEmpty)
                                              await controller
                                                  .nmbrPetitsEditing(
                                                      int.parse(value));
                                            if (value.trim().isEmpty)
                                              await controller
                                                  .nmbrPetitsEditing(0);
                                            await controller.validateMe();
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            isCollapsed: true,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText:
                                                "${controller.stockOeuf.petits}",
                                            errorText: controller.erro1.value
                                                ? controller.invalide1.value
                                                    ? "valeur invalide !"
                                                    : "doit être >= 0 et <= ${controller.stockOeuf.petits}"
                                                : null,
                                            errorStyle: TextStyle(height: 0),
                                            filled: true,
                                            isDense: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 65,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(8),
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
                                      child: Text("Moyens"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Obx(() => TextFormField(
                                          enabled:
                                              controller.stockOeuf.moyens > 0
                                                  ? true
                                                  : false,
                                          style: TextStyle(fontSize: 16),
                                          onChanged: (value) async {
                                            if (value.trim().isNotEmpty)
                                              await controller
                                                  .nmbrMoyensEditing(
                                                      int.parse(value));
                                            if (value.trim().isEmpty)
                                              await controller
                                                  .nmbrMoyensEditing(0);
                                            await controller.validateMe();
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            isCollapsed: true,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText:
                                                "${controller.stockOeuf.moyens}",
                                            errorText: controller.erro2.value
                                                ? controller.invalide2.value
                                                    ? "valeur invalide !"
                                                    : "doit être <= ${controller.stockOeuf.moyens}"
                                                : null,
                                            errorStyle: TextStyle(height: 0),
                                            filled: true,
                                            isDense: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 65,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(8),
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
                                      child: Text("Grands"),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Obx(() => TextFormField(
                                          enabled:
                                              controller.stockOeuf.grands > 0
                                                  ? true
                                                  : false,
                                          style: TextStyle(fontSize: 16),
                                          onChanged: (value) async {
                                            if (value.trim().isNotEmpty)
                                              await controller
                                                  .nmbrGrandsEditing(
                                                      int.parse(value));
                                            if (value.trim().isEmpty)
                                              await controller
                                                  .nmbrGrandsEditing(0);
                                            await controller.validateMe();
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            isCollapsed: true,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText:
                                                "${controller.stockOeuf.grands}",
                                            errorText: controller.erro3.value
                                                ? controller.invalide3.value
                                                    ? "valeur invalide !"
                                                    : "doit être >= 0 et <= ${controller.stockOeuf.grands}"
                                                : null,
                                            errorStyle: TextStyle(height: 0),
                                            filled: true,
                                            isDense: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                child: Obx(() => Text(
                                    "Total : ${controller.nombreP.value + controller.nombreM.value + controller.nombreG.value}"))),
                            Container(
                                margin: EdgeInsets.only(bottom: 4),
                                child: Text("Motif")),
                            Container(
                              child: TextFormField(
                                style: TextStyle(fontSize: 16),
                                onChanged: (value) async {
                                  if (value.trim().isNotEmpty)
                                    controller.motifEditing(value);
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.all(10),
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
                    ),
                  ),
                ],
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
                        onPressed: (controller.nombreP.value +
                                        controller.nombreM.value +
                                        controller.nombreG.value) >
                                    0 &&
                                controller.isValidate.value &&
                                controller.motif.value != "" &&
                                controller.date.value != "Date"
                            ? () async {
                                await controller.saveUsedOeuf();
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
                                          //controller.itemLotCollect.value = [];
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
