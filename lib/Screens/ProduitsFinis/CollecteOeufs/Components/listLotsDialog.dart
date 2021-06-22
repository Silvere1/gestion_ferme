import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
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
        height: Get.height * 0.7,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller.getAllItem(lots);
                        Get.back();
                      },
                      child: Text("Sélectionner tout"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lots.length,
                itemBuilder: (context, i) => Container(
                  height: 45,
                  margin: EdgeInsets.all(4),
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.getItem(lots[i]);
                      Get.back();
                    },
                    child: Text("Lot N°: ${lots[i].num}"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
