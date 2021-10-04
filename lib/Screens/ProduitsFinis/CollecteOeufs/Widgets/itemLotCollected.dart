import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:get/get.dart';

class ItemLotCollected extends StatefulWidget {
  ItemLotCollected(
      this.i,
      this.ediTextC1,
      this.ediTextC2,
      this.ediTextC3,
      this.ediTextC4,
      this.ediTextC5,
      this.ediTextC6,
      this.ediTextC7,
      this.ediTextC8);
  final int i;
  final TextEditingController ediTextC1;
  final TextEditingController ediTextC2;
  final TextEditingController ediTextC3;
  final TextEditingController ediTextC4;
  final TextEditingController ediTextC5;
  final TextEditingController ediTextC6;
  final TextEditingController ediTextC7;
  final TextEditingController ediTextC8;

  @override
  _ItemLotCollectedState createState() => _ItemLotCollectedState(
      i,
      ediTextC1,
      ediTextC2,
      ediTextC3,
      ediTextC4,
      ediTextC5,
      ediTextC6,
      ediTextC7,
      ediTextC8);
}

class _ItemLotCollectedState extends State<ItemLotCollected> {
  CollecteOeufsController controller = Get.find();
  final int i;

  final TextEditingController ediTextC1;
  final TextEditingController ediTextC2;
  final TextEditingController ediTextC3;
  final TextEditingController ediTextC4;
  final TextEditingController ediTextC5;
  final TextEditingController ediTextC6;
  final TextEditingController ediTextC7;
  final TextEditingController ediTextC8;

  @override
  void dispose() {
    ediTextC1.dispose();
    ediTextC2.dispose();
    ediTextC3.dispose();
    ediTextC4.dispose();
    ediTextC5.dispose();
    ediTextC6.dispose();
    ediTextC7.dispose();
    ediTextC8.dispose();
    super.dispose();
  }

  /*  var ediTextC1 = TextEditingController();
  var ediTextC2 = TextEditingController();
  var ediTextC3 = TextEditingController();
  var ediTextC4 = TextEditingController();*/

  _ItemLotCollectedState(
      this.i,
      this.ediTextC1,
      this.ediTextC2,
      this.ediTextC3,
      this.ediTextC4,
      this.ediTextC5,
      this.ediTextC6,
      this.ediTextC7,
      this.ediTextC8);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 10, right: 10),
      /*decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(6),
      ),*/
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
            spreadRadius: 0.1,
          )
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 0.9,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lot N°: ${controller.itemLotCollect[i].num}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                          "${controller.itemLotCollect[i].nmbrVolauillles} volailles(s)"),
                    ],
                  ),
                  InkWell(
                      splashColor: Colors.red,
                      onTap: () async {
                        ediTextC1.clear();
                        ediTextC2.clear();
                        ediTextC3.clear();
                        ediTextC4.clear();
                        ediTextC5.clear();
                        ediTextC6.clear();
                        ediTextC7.clear();
                        ediTextC8.clear();
                        await controller.deleteItem(
                            controller.itemLotCollect[i],
                            controller.newListCollect[i]);
                        await controller.validateMe();
                        FocusScope.of(context).unfocus();
                      },
                      child: Icon(Icons.close))
                ],
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(child: Text("Plateau(x)")),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(child: Text("Oeuf(s)")),
                        ),
                      ),
                    ],
                  )),
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 1),
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
                        child: Text("Petits"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => TextFormField(
                            controller: ediTextC1,
                            onChanged: (value) async {
                              ediTextC2.clear();
                              if (value.trim().isNotEmpty) {
                                if (mounted)
                                  await controller.nbrPetEditingPlt(
                                      int.parse(value),
                                      controller.itemLotCollect[i]);
                              } else {
                                await controller.nbrPetEditingPlt(
                                    0, controller.itemLotCollect[i]);
                              }
                              await controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText:
                                  "${controller.newListCollect[i].petits ~/ 30}",
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => TextFormField(
                            //controller: ediTextC2,
                            onChanged: (value) async {
                              if (value.trim().isNotEmpty) {
                                await controller.nbrPetEditing(int.parse(value),
                                    controller.itemLotCollect[i]);
                              } else {
                                await controller.nbrPetEditing(
                                    0, controller.itemLotCollect[i]);
                              }
                              await controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText:
                                  "${controller.newListCollect[i].petits % 30}",
                              filled: true,
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
                height: 55,
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
                        child: Text("Moyens"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => TextFormField(
                            controller: ediTextC3,
                            onChanged: (value) async {
                              if (value.trim().isNotEmpty) {
                                await controller.nbrMoyEditingPlt(
                                    int.parse(value),
                                    controller.itemLotCollect[i]);
                              } else {
                                await controller.nbrMoyEditingPlt(
                                    0, controller.itemLotCollect[i]);
                              }

                              await controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText:
                                  "${controller.newListCollect[i].moyens ~/ 30}",
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => TextFormField(
                            controller: ediTextC4,
                            onChanged: (value) async {
                              if (value.trim().isNotEmpty) {
                                await controller.nbrMoyEditing(int.parse(value),
                                    controller.itemLotCollect[i]);
                              } else {
                                await controller.nbrMoyEditing(
                                    0, controller.itemLotCollect[i]);
                              }
                              await controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText:
                                  "${controller.newListCollect[i].moyens % 30}",
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
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
                height: 55,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  //color: Color(0xffBDD5FF),
                  border: Border.all(color: Theme.of(context).primaryColor),
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
                            controller: ediTextC5,
                            onChanged: (value) async {
                              if (value.trim().isNotEmpty) {
                                await controller.nbrGraEditingPlt(
                                    int.parse(value),
                                    controller.itemLotCollect[i]);
                              } else {
                                await controller.nbrGraEditingPlt(
                                    0, controller.itemLotCollect[i]);
                              }
                              await controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText:
                                  "${controller.newListCollect[i].grands ~/ 30}",
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => TextFormField(
                            controller: ediTextC6,
                            onChanged: (value) async {
                              if (value.trim().isNotEmpty) {
                                await controller.nbrGraEditing(int.parse(value),
                                    controller.itemLotCollect[i]);
                              } else {
                                await controller.nbrGraEditing(
                                    0, controller.itemLotCollect[i]);
                              }
                              await controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText:
                                  "${controller.newListCollect[i].grands % 30}",
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
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
                height: 55,
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
                        child: Text("Fêlés"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => TextFormField(
                            controller: ediTextC7,
                            onChanged: (value) async {
                              if (value.trim().isNotEmpty) {
                                await controller.nbrFelEditingPlt(
                                    int.parse(value),
                                    controller.itemLotCollect[i]);
                              } else {
                                await controller.nbrFelEditingPlt(
                                    0, controller.itemLotCollect[i]);
                              }
                              await controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText:
                                  "${controller.newListCollect[i].feles ~/ 30}",
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => TextFormField(
                            controller: ediTextC8,
                            onChanged: (value) async {
                              if (value.trim().isNotEmpty) {
                                await controller.nbrFelEditing(int.parse(value),
                                    controller.itemLotCollect[i]);
                              } else {
                                await controller.nbrFelEditing(
                                    0, controller.itemLotCollect[i]);
                              }
                              await controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText:
                                  "${controller.newListCollect[i].feles % 30}",
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
