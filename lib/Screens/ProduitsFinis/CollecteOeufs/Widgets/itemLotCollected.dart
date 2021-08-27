import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:get/get.dart';

class ItemLotCollected extends StatefulWidget {
  ItemLotCollected(
      this.i, this.ediTextC1, this.ediTextC2, this.ediTextC3, this.ediTextC4);
  final int i;
  final TextEditingController ediTextC1;
  final TextEditingController ediTextC2;
  final TextEditingController ediTextC3;
  final TextEditingController ediTextC4;

  @override
  _ItemLotCollectedState createState() =>
      _ItemLotCollectedState(i, ediTextC1, ediTextC2, ediTextC3, ediTextC4);
}

class _ItemLotCollectedState extends State<ItemLotCollected> {
  CollecteOeufsController controller = Get.find();
  final int i;

  final TextEditingController ediTextC1;
  final TextEditingController ediTextC2;
  final TextEditingController ediTextC3;
  final TextEditingController ediTextC4;

  @override
  void dispose() {
    ediTextC1.dispose();
    ediTextC2.dispose();
    ediTextC3.dispose();
    ediTextC4.dispose();
    super.dispose();
  }

  /*  var ediTextC1 = TextEditingController();
  var ediTextC2 = TextEditingController();
  var ediTextC3 = TextEditingController();
  var ediTextC4 = TextEditingController();*/

  _ItemLotCollectedState(
      this.i, this.ediTextC1, this.ediTextC2, this.ediTextC3, this.ediTextC4);

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
                  Text(
                    "Lot N°: ${controller.itemLotCollect[i].num}",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                      splashColor: Colors.red,
                      onTap: () async {
                        ediTextC1.clear();
                        ediTextC2.clear();
                        ediTextC3.clear();
                        ediTextC4.clear();
                        FocusScope.of(context).unfocus();
                        controller.deleteItem(controller.itemLotCollect[i],
                            controller.newListCollect[i]);
                        await controller.validateMe();
                      },
                      child: Icon(Icons.close))
                ],
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
                        child: Text("Petits"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => TextFormField(
                            controller: ediTextC1,
                            onChanged: (value) {
                              if (value.trim().isNotEmpty)
                                controller.nbrPetEditing(int.parse(value),
                                    controller.itemLotCollect[i]);
                              if (value.trim().isEmpty)
                                controller.nbrPetEditing(
                                    0, controller.itemLotCollect[i]);
                              setState(() {});
                              controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText:
                                  "${controller.newListCollect[i].petits}",
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
                            controller: ediTextC2,
                            onChanged: (value) {
                              if (value.trim().isNotEmpty)
                                controller.nbrMoyEditing(int.parse(value),
                                    controller.itemLotCollect[i]);
                              if (value.trim().isEmpty)
                                controller.nbrMoyEditing(
                                    0, controller.itemLotCollect[i]);
                              setState(() {});
                              controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText:
                                  "${controller.newListCollect[i].moyens}",
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
                            controller: ediTextC3,
                            onChanged: (value) {
                              if (value.trim().isNotEmpty)
                                controller.nbrGraEditing(int.parse(value),
                                    controller.itemLotCollect[i]);
                              if (value.trim().isEmpty)
                                controller.nbrGraEditing(
                                    0, controller.itemLotCollect[i]);
                              setState(() {});
                              controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText:
                                  "${controller.newListCollect[i].grands}",
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
                            controller: ediTextC4,
                            onChanged: (value) {
                              if (value.trim().isNotEmpty)
                                controller.nbrFelEditing(int.parse(value),
                                    controller.itemLotCollect[i]);
                              if (value.trim().isEmpty)
                                controller.nbrFelEditing(
                                    0, controller.itemLotCollect[i]);
                              setState(() {});
                              controller.validateMe();
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "${controller.newListCollect[i].feles}",
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
