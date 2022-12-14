import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';
import 'package:get/get.dart';

class ListLotsDialog extends StatefulWidget {
  const ListLotsDialog();

  @override
  _ListLotsDialogState createState() => _ListLotsDialogState();
}

class _ListLotsDialogState extends State<ListLotsDialog> {
  UsageController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: controller.listLot.length > 0
            ? Container(
                height: 54.0 * controller.listLot.length,
                child: ListView.builder(
                  itemCount: controller.listLot.length,
                  itemBuilder: (context, i) => Container(
                    height: 45,
                    margin: EdgeInsets.all(4),
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller.getItem(controller.listLot[i]);

                        Get.back();
                      },
                      child: Text("Lot N°: ${controller.listLot[i].num}"),
                    ),
                  ),
                ),
              )
            : Container(
                height: 54,
                width: double.infinity,
                child: Center(
                  child: Text("Aucun lot n'est disponible !"),
                ),
              ),
      ),
    );
  }
}
