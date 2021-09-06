import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/App/Models/uniteModel.dart';
import 'package:get/get.dart';

class CreateProvende extends StatefulWidget {
  const CreateProvende();

  @override
  _CreateProvendeState createState() => _CreateProvendeState();
}

class _CreateProvendeState extends State<CreateProvende> {
  ApproController controller = Get.find();
  var choixUnite;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          title: Text("Créer une nouvelle Provende"),
          centerTitle: true,
          elevation: 0.5,
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
                      Obx(
                        () => TextFormField(
                          onChanged: (value) {
                            if (value.trim().isNotEmpty &&
                                value.trim().length >= 1)
                              controller.nameProvendeEditing(value);
                            else
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
                              hintText: "Nom de la provende"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 40,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: DropdownButton(
                              underline: Container(),
                              isDense: true,
                              isExpanded: true,
                              hint: Text("Unitée de mesure"),
                              value: choixUnite,
                              onChanged: (value) {
                                setState(() {
                                  choixUnite = value;
                                  controller.unitPv.value = choixUnite;
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
                          if (value.trim().isNotEmpty)
                            controller
                                .initStockProvendeEditing(double.parse(value));
                          if (value.trim().isEmpty)
                            controller.initStockProvendeEditing(0);
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
                          if (value.trim().isNotEmpty)
                            controller
                                .valueProvendeEditing(double.parse(value));
                          if (value.trim().isEmpty)
                            controller.valueProvendeEditing(0);
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
                      onPressed: controller.nameProvende.value != "" &&
                              controller.unitPv.value != "" &&
                              controller.initStkPv.value >= 0 &&
                              controller.valuePv >= 0
                          ? () async {
                              await controller.addProvende();
                              Get.back();
                            }
                          : null,
                      child: Text("Enregistrer"),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
