import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/venteController.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:get/get.dart';

class ListLotsDialog extends StatefulWidget {
  const ListLotsDialog(this.uni);
  final bool uni;

  @override
  _ListLotsDialogState createState() => _ListLotsDialogState(uni);
}

class _ListLotsDialogState extends State<ListLotsDialog> {
  VenteController controller = Get.find();
  final bool uni;

  _ListLotsDialogState(this.uni);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: Get.height * 0.7,
        child: ListView.builder(
          itemCount: lots.length,
          itemBuilder: (context, i) => Container(
            height: 45,
            margin: EdgeInsets.all(4),
            child: ElevatedButton(
              onPressed: () async {
                uni
                    ? await controller.getItem(lots[i])
                    : controller.getMoreItem(lots[i]);
                Get.back();
              },
              child: Text("Lot N°: ${lots[i].num}"),
            ),
          ),
        ),
      ),
    );
  }
}
