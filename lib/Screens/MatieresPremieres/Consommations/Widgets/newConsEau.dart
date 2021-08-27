import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:get/get.dart';

class NewConsEau extends StatefulWidget {
  const NewConsEau(this.pageController);
  final PageController pageController;

  @override
  _NewConsEauState createState() => _NewConsEauState(pageController);
}

class _NewConsEauState extends State<NewConsEau> {
  AddLotController lotController = Get.find();
  ConsommationController controller = Get.find();
  final PageController pageController;
  _NewConsEauState(this.pageController);
  bool all = false;

  @override
  void initState() {
    super.initState();
    /*getLots();*/
  }

  /*getLots() async {
    await lotController.getListLots();
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(
          width: Get.width,
          /*color: Color(0xfffafafa),*/
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      await controller.getAllItemConsEau(lotController.listlot);
                    } else {
                      await controller.deletAllItem();
                    }
                    await controller.validateConsEau();
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
        Expanded(
          child: Obx(
            () => lotController.listlot.length != 0
                ? ListView.builder(
                    itemCount: lotController.listlot.length,
                    itemBuilder: (context, i) => Container(
                      margin: EdgeInsets.only(top: 6, left: 10, right: 10),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        elevation: 2,
                        child: Obx(() => CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              value: lotController.listlot[i].select,
                              onChanged: (value) async {
                                lotController.listlot[i].select = value!;
                                setState(() {});
                                if (lotController.listlot[i].select) {
                                  await controller
                                      .getItemConsEau(lotController.listlot[i]);
                                } else {
                                  await controller.deleteItemConsEau(
                                      lotController.listlot[i]);
                                }
                                await controller.validateConsEau();
                              },
                              title: Container(
                                child: Container(
                                  height: 60,
                                  constraints: BoxConstraints(),
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 18, right: 10),
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
                                                  if (value.trim().isNotEmpty)
                                                    controller.eauQteEditing(
                                                        double.parse(value),
                                                        lotController
                                                            .listlot[i]);
                                                  if (value.trim().isEmpty)
                                                    controller.eauQteEditing(
                                                        0,
                                                        lotController
                                                            .listlot[i]);
                                                  await controller
                                                      .validateConsEau();
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  isCollapsed: true,
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
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
                      "Vous ne disposez d'aucun lot pour l'instant !",
                      textAlign: TextAlign.center,
                    ),
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
                      onPressed: controller.isValideConsEau.value &&
                              controller.date.value != "Date" &&
                              controller.newListConsomEau.length > 0
                          ? () async {
                              await controller.checkList();
                              await controller.saveConsEau();
                              lotController.listlot.forEach((e) {
                                e.select = false;
                              });
                              all = false;
                              setState(() {});
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
                                        Get.back();
                                        pageController.previousPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeOutBack);
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
    );
  }
}
