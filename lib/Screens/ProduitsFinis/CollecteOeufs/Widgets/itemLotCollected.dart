import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:get/get.dart';

class ItemLotCollected extends StatefulWidget {
  ItemLotCollected(this.i);
  final int i;

  @override
  _ItemLotCollectedState createState() => _ItemLotCollectedState(i);
}

class _ItemLotCollectedState extends State<ItemLotCollected> {
  CollecteOeufsController controller = Get.find();
  final int i;

  _ItemLotCollectedState(this.i);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Lot N°: ${controller.itemLotCollect[i].num}"),
                  InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        controller.deleteItem(controller.itemLotCollect[i]);
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
                        child: Text("Petits"),
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
                        child: Text("Moyens"),
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
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(4),
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
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(4),
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
                        child: Text("Fêlés"),
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
        ),
      ),
    );
  }
}
