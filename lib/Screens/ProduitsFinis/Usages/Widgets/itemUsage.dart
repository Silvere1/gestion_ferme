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
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lot N°: ${controller.itemUsage[i].num}",
                style: TextStyle(fontWeight: FontWeight.w600),
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
                            onChanged: (value) {
                              if (value.trim().isNotEmpty)
                                controller.qteEditing(int.parse(value));
                              if (value.trim().isEmpty)
                                controller.qteEditing(0);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText:
                                  "${controller.itemUsage[i].nmbrVolauillles}",
                              filled: true,
                              isDense: true,
                              errorText: controller.qteError.value
                                  ? "doit être > 0 et <= ${controller.itemUsage[i].nmbrVolauillles}"
                                  : null,
                              errorStyle: TextStyle(height: 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          )),
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
                    if (value.trim().isNotEmpty)
                      controller.motifVolaillesEditing(value);
                    if (value.trim().isEmpty)
                      controller.motifVolaillesEditing("");
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
    );
  }
}
