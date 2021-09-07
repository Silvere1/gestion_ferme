import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:get/get.dart';

class ListLotsDialog extends StatefulWidget {
  const ListLotsDialog();

  @override
  _ListLotsDialogState createState() => _ListLotsDialogState();
}

class _ListLotsDialogState extends State<ListLotsDialog> {
  CollecteOeufsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: controller.listlot.length > 0
            ? Container(
                height: 54 * controller.listlot.length.toDouble(),
                child: Column(
                  children: [
                    /* Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () async {
                                await controller
                                    .getAllItem(lotController.listlot);
                                Get.back();
                              },
                              child: Text("Sélectionner tout"),
                            ),
                          ),
                        ),
                      ],
                    ),*/
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.listlot.length,
                        itemBuilder: (context, i) => Container(
                          height: 45,
                          margin: EdgeInsets.all(4),
                          child: ElevatedButton(
                            onPressed: () async {
                              await controller.getItem(controller.listlot[i]);
                              Navigator.pop(context);
                            },
                            child: Text("Lot N°: ${controller.listlot[i].num}"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 84,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    "Vous ne disposez d'aucun lot de volailles à cette Date !",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
      ),
    );
  }
}
