import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';
import 'package:get/get.dart';

class RenameProvende extends StatefulWidget {
  const RenameProvende(this.provende);
  final Provende provende;

  @override
  _RenameProvendeState createState() => _RenameProvendeState(provende);
}

class _RenameProvendeState extends State<RenameProvende> {
  ApproController controller = Get.find();
  final Provende provende;

  _RenameProvendeState(this.provende);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      child: Container(
        height: 120,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Obx(
              () => TextFormField(
                onChanged: (value) {
                  if (value.trim().isNotEmpty && value.trim().length >= 4)
                    controller.nameProvendeEditing(value);
                  if (value.trim().length < 4)
                    controller.nameProvendeEditing("");
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    errorText: controller.nameProvendeError.value
                        ? "ce nom existe déjà"
                        : null,
                    errorStyle: TextStyle(height: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    hintText: "${provende.nom}"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    child: Obx(() => ElevatedButton(
                          onPressed: !controller.nameProvendeError.value &&
                                  controller.nameProvende.value != ""
                              ? () async {
                                  await controller.renameProvende(provende);
                                  Get.back();
                                }
                              : null,
                          child: Text("Valider"),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
