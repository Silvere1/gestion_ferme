import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';
import 'package:get/get.dart';

class ItemUsage extends StatelessWidget {
  const ItemUsage(this.i);
  final int i;

  @override
  Widget build(BuildContext context) {
    UsageController controller = Get.find();
    return Container(
      margin: EdgeInsets.all(10),
      /*decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(6),
      ),*/
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lot N°: ${controller.itemUsage[i].num}"),
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
            ],
          ),
        ),
      ),
    );
  }
}
