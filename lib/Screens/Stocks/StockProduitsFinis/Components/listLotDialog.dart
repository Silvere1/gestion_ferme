import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:get/get.dart';

class ListLotsDialog extends StatefulWidget {
  const ListLotsDialog();

  @override
  _ListLotsDialogState createState() => _ListLotsDialogState();
}

class _ListLotsDialogState extends State<ListLotsDialog> {
  AddLotController _addLotController = Get.find();
  EditStockController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 54.0 * _addLotController.listlot.length,
        child: _addLotController.listlot.length > 0
            ? ListView.builder(
                itemCount: _addLotController.listlot.length,
                itemBuilder: (context, i) => Container(
                  height: 45,
                  margin: EdgeInsets.all(4),
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.getItem(_addLotController.listlot[i]);

                      Get.back();
                    },
                    child: Text("Lot N°: ${_addLotController.listlot[i].num}"),
                  ),
                ),
              )
            : Container(
                height: 54,
                child: Center(
                  child: Text("Aucun lot n'est disponible !"),
                ),
              ),
      ),
    );
  }
}
