import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:get/get.dart';

class AddLotByAchat extends StatefulWidget {
  AddLotByAchat({Key? key}) : super(key: key);

  @override
  _AddLotByAchatState createState() => _AddLotByAchatState();
}

class _AddLotByAchatState extends State<AddLotByAchat> {
  AddLotController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                child: Text("Nombre de volailles"),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.trim().isNotEmpty)
                                    controller.nmbrEditing(int.parse(value));
                                  if (value.trim().isEmpty)
                                    controller.nmbrEditing(0);
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
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
                                child: Text("Date d'achat"),
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
                                                controller.getDate2(
                                                    value.toIso8601String()),
                                            });
                                      },
                                      decoration: InputDecoration(
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        hintText: "${controller.date2.value}",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    )),
                              ),
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
                                child: Text("Âge (jours)"),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.trim().isNotEmpty)
                                    controller.ageEditing(int.parse(value));
                                  if (value.trim().isEmpty)
                                    controller.ageEditing(0);
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
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
                                child: Text("Montant"),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.trim().isNotEmpty)
                                    controller.montantEditing(int.parse(value));
                                  if (value.trim().isEmpty)
                                    controller.montantEditing(0);
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.all(10),
                                  filled: true,
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
                        height: 45,
                        width: Get.width - 28,
                        margin: EdgeInsets.only(bottom: 20, top: 16),
                        child: Obx(() => ElevatedButton(
                              onPressed: controller.nombre.value > 0 &&
                                      controller.date2.value != "Date" &&
                                      controller.age.value > 0 &&
                                      controller.montant.value > 0
                                  ? () async {
                                      await controller.addLotTypeTwo();
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
      ),
    );
  }
}
