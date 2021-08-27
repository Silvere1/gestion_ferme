import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:get/get.dart';

class ItemEditProduit extends StatefulWidget {
  const ItemEditProduit(this.i, this._textE);
  final int i;
  final TextEditingController _textE;

  @override
  _ItemEditProduitState createState() => _ItemEditProduitState(i);
}

class _ItemEditProduitState extends State<ItemEditProduit> {
  final int i;
  EditStockController controller = Get.find();

  _ItemEditProduitState(this.i);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
            spreadRadius: 0.1,
          )
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 0.9,
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Produit : ${controller.itemProduit[i].nom}",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 4),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text("Quantité"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: widget._textE,
                        style: TextStyle(fontSize: 16),
                        onChanged: (value) async {
                          if (value.trim().isNotEmpty)
                            await controller
                                .qteProduitEditing(double.parse(value));
                          if (value.trim().isEmpty)
                            controller.valQteProd.value = "";
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          isDense: true,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: "${controller.itemProduit[i].qte}",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
