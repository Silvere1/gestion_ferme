import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gestionferme/App/Models/uniteModel.dart';

class CreateProdTraite extends StatefulWidget {
  const CreateProdTraite();

  @override
  _CreateProdTraiteState createState() => _CreateProdTraiteState();
}

class _CreateProdTraiteState extends State<CreateProdTraite> {
  var choixUnite;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Créer un nouveau Produit"),
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.only(top: 10, left: 18, right: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {},
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            hintText: "Nom du produit"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton(
                            onTap: () {},
                            underline: Container(),
                            isExpanded: true,
                            hint: Text("Unitée de mesure"),
                            value: choixUnite,
                            onChanged: (value) {
                              setState(() {
                                choixUnite = value;
                              });
                            },
                            items: unites.map((e) {
                              return DropdownMenuItem(
                                value: e.unite,
                                child: Text(e.unite),
                              );
                            }).toList()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {},
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
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
                        onChanged: (value) {},
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            hintText: "Valeur"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(bottom: 26),
                  width: Get.width - 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Enregistrer"),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
