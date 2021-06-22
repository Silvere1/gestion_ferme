import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/perteController.dart';
import 'package:get/get.dart';

class ItemPerte extends StatelessWidget {
  const ItemPerte(this.i);
  final int i;
  @override
  Widget build(BuildContext context) {
    PerteController controller = Get.find();
    return Container(
      margin: EdgeInsets.all(8),
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
              Text("Lot N°: ${controller.itemPerte[i].num}"),
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
              SizedBox(
                height: 8,
              ),
              Text("Motif"),
              Container(
                height: 45,
                margin: EdgeInsets.only(top: 6),
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
      ),
    );
  }
}
