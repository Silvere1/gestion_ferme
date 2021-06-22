import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/perteController.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:get/get.dart';

class ListLotsDialog extends StatefulWidget {
  const ListLotsDialog();

  @override
  _ListLotsDialogState createState() => _ListLotsDialogState();
}

class _ListLotsDialogState extends State<ListLotsDialog> {
  PerteController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: Get.height * 0.7,
        child: Column(
          children: [
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
