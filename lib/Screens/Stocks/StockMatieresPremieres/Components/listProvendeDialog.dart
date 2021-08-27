import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:get/get.dart';

class ListProvendeDialog extends StatefulWidget {
  const ListProvendeDialog();

  @override
  _ListProvendeDialogState createState() => _ListProvendeDialogState();
}

class _ListProvendeDialogState extends State<ListProvendeDialog> {
  ApproController _approController = Get.find();
  EditStockController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 54.0 * _approController.listProvendes.length,
        child: _approController.listProvendes.length > 0
            ? ListView.builder(
                itemCount: _approController.listProvendes.length,
                itemBuilder: (context, i) => Container(
                  height: 45,
                  margin: EdgeInsets.all(4),
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller
                          .getItemProvende(_approController.listProvendes[i]);

                      Get.back();
                    },
                    child: Text("${_approController.listProvendes[i].nom}"),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Text("Aucune provende n'est disponible !"),
                ),
              ),
      ),
    );
  }
}
