import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gestionferme/App/Controllers/venteController.dart';

class ItemLotVente extends StatefulWidget {
  const ItemLotVente(this.i, this.uni);
  final int i;
  final bool uni;

  @override
  _ItemLotVenteState createState() => _ItemLotVenteState(i, uni);
}

class _ItemLotVenteState extends State<ItemLotVente> {
  VenteController controller = Get.find();
  final int i;
  final bool uni;

  _ItemLotVenteState(this.i, this.uni);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 2,
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
                        controller.deleteItem(controller.itemVolaillesVente[i]);
                      },
                      child: Icon(Icons.close))
                ],
              ),
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(4),
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
              uni
                  ? Container(
                      height: 55,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
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
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
