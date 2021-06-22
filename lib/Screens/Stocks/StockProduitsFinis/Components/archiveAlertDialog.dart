import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:get/get.dart';

class ArchiveAlertDialog extends StatefulWidget {
  const ArchiveAlertDialog(this.lot);
  final Lot lot;

  @override
  _ArchiveAlertDialogState createState() => _ArchiveAlertDialogState(lot);
}

class _ArchiveAlertDialogState extends State<ArchiveAlertDialog> {
  final Lot lot;

  _ArchiveAlertDialogState(this.lot);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Attention",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Le lot de volaille N° : ${lot.num} sera supprimé et envoié dans les archives !",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 6,
            ),
            Text("Voulez vous continuer ?"),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Non")),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.back();
                      },
                      child: Text("Oui")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
