import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:get/get.dart';

class ListLotsDialog extends StatefulWidget {
  const ListLotsDialog();

  @override
  _ListLotsDialogState createState() => _ListLotsDialogState();
}

class _ListLotsDialogState extends State<ListLotsDialog> {
  CollecteOeufsController controller = Get.find();
  AddLotController lotController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 54 * lotController.listlot.length.toDouble(),
        child: lotController.listlot.length > 0
            ? Column(
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
                      itemCount: lotController.listlot.length,
                      itemBuilder: (context, i) => Container(
                        height: 45,
                        margin: EdgeInsets.all(4),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller.getItem(lotController.listlot[i]);
                            Navigator.pop(context);
                          },
                          child:
                              Text("Lot N°: ${lotController.listlot[i].num}"),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                height: 54,
                child: Center(
                  child: Text(
                    "Vous ne disposez d'aucun lot de volailles actuellement !",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
      ),
    );
  }
}
