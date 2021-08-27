import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/venteController.dart';
import 'package:get/get.dart';

class ItemLotVente extends StatefulWidget {
  const ItemLotVente(this.i);
  final int i;
  /*final bool uni;*/

  @override
  _ItemLotVenteState createState() => _ItemLotVenteState(i);
}

class _ItemLotVenteState extends State<ItemLotVente> {
  VenteController controller = Get.find();
  final int i;

  _ItemLotVenteState(this.i);
  @override
  Widget build(BuildContext context) {
    return Container(
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
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Lot N°: ${controller.itemVolaillesVente[i].num}"),
                  InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        controller.deleteItem(controller.itemVolaillesVente[i],
                            controller.newListVenteVolailles[i], i);
                      },
                      child: Icon(Icons.close))
                ],
              ),
              Container(
                height: 65,
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
                        child: Text("Quantité"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => TextFormField(
                            style: TextStyle(fontSize: 16),
                            onChanged: (value) async {
                              if (value.trim().isNotEmpty)
                                await controller.qteEditing(int.parse(value),
                                    controller.itemVolaillesVente[i]);
                              if (value.trim().isEmpty)
                                await controller.qteEditing(
                                    0, controller.itemVolaillesVente[i]);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText:
                                  "${controller.itemVolaillesVente[i].nmbrVolauillles}",
                              errorText: controller.erroQte[i]
                                  ? "doit être > 0 et <= ${controller.itemVolaillesVente[i].nmbrVolauillles}"
                                  : null,
                              errorStyle: TextStyle(height: 0),
                              filled: true,
                              isDense: true,
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
                height: 65,
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
                        child: Text("Montant"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Obx(() => TextFormField(
                            style: TextStyle(fontSize: 16),
                            onChanged: (value) async {
                              if (value.trim().isNotEmpty)
                                await controller.montantEditing(
                                    double.parse(value),
                                    controller.itemVolaillesVente[i]);
                              if (value.trim().isEmpty)
                                await controller.montantEditing(
                                    0, controller.itemVolaillesVente[i]);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              errorText: controller.erroMontant[i]
                                  ? "doit être > 0"
                                  : null,
                              errorStyle: TextStyle(height: 0),
                              filled: true,
                              isDense: true,
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
