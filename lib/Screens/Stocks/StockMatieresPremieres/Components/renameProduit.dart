import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:get/get.dart';

class RenameProduit extends StatefulWidget {
  const RenameProduit(this.produit);
  final Produit produit;

  @override
  _RenameProduitState createState() => _RenameProduitState(produit);
}

class _RenameProduitState extends State<RenameProduit> {
  final Produit produit;
  ApproController controller = Get.find();

  _RenameProduitState(this.produit);
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
                    controller.namePrduitEditing(value);
                  if (value.trim().length < 4) controller.namePrduitEditing("");
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    errorText: controller.nameProduitError.value
                        ? "ce nom existe déjà"
                        : null,
                    errorStyle: TextStyle(height: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    hintText: "${produit.nom}"),
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
                          onPressed: !controller.nameProduitError.value &&
                                  controller.nameProduit.value != ""
                              ? () async {
                                  await controller.renameProduit(produit);
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
