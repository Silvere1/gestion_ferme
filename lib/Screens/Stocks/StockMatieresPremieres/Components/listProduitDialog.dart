import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:get/get.dart';

class ListProduitDialog extends StatefulWidget {
  const ListProduitDialog();

  @override
  _ListProduitDialogState createState() => _ListProduitDialogState();
}

class _ListProduitDialogState extends State<ListProduitDialog> {
  ApproController _approController = Get.find();
  EditStockController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 54.0 * _approController.listProdTraite.length,
        child: _approController.listProdTraite.length > 0
            ? ListView.builder(
                itemCount: _approController.listProdTraite.length,
                itemBuilder: (context, i) => Container(
                  height: 45,
                  margin: EdgeInsets.all(4),
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller
                          .getItemProduit(_approController.listProdTraite[i]);

                      Get.back();
                    },
                    child: Text("${_approController.listProdTraite[i].nom}"),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Text("Aucun produit n'est disponible !"),
                ),
              ),
      ),
    );
  }
}
