import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/App/Models/uniteModel.dart';
import 'package:get/get.dart';

class CreateProdTraite extends StatefulWidget {
  const CreateProdTraite();

  @override
  _CreateProdTraiteState createState() => _CreateProdTraiteState();
}

class _CreateProdTraiteState extends State<CreateProdTraite> {
  ApproController controller = Get.find();
  var choixUnite;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffeeeeee),
          appBar: AppBar(
            title: Text("Créer un nouveau Produit"),
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.only(top: 10, left: 18, right: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Obx(() => TextFormField(
                              onChanged: (value) {
                                if (value.trim().isNotEmpty &&
                                    value.trim().length >= 1)
                                  controller.namePrduitEditing(value);
                                else
                                  controller.namePrduitEditing("");
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
                                  hintText: "Nom du produit"),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: DropdownButton(
                                onTap: () {},
                                underline: Container(),
                                isExpanded: true,
                                isDense: true,
                                hint: Text("Unitée de mesure"),
                                value: choixUnite,
                                onChanged: (value) {
                                  setState(() {
                                    choixUnite = value;
                                    controller.uniPd.value = choixUnite;
                                  });
                                },
                                items: unites.map((e) {
                                  return DropdownMenuItem(
                                    value: e.unite,
                                    child: Text(e.unite),
                                  );
                                }).toList()),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /*TextFormField(
                          onChanged: (value) {
                            if (value.trim().isNotEmpty && value.trim().isNum)
                              controller
                                  .initStockProduitEditing(double.parse(value));
                            if (value.trim().isEmpty)
                              controller.initStockProduitEditing(0);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              hintText: "Stock initial"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            if (value.trim().isNotEmpty && value.trim().isNum)
                              controller
                                  .valueProduitEditing(double.parse(value));
                            if (value.trim().isEmpty)
                              controller.valueProduitEditing(0);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              hintText: "Valeur"),
                        ),*/
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(bottom: 20, top: 6),
                  width: Get.width - 50,
                  child: Obx(() => ElevatedButton(
                        onPressed: controller.nameProduit.value != "" &&
                                controller.uniPd.value != "" &&
                                controller.initStkPd.value >= 0 &&
                                controller.valuePd >= 0
                            ? () async {
                                await controller.addProduit();
                                Get.back();
                              }
                            : null,
                        child: Text("Enregistrer"),
                      )),
                )
              ],
            ),
          )),
    );
  }
}
