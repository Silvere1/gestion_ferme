import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';

class ItemProdTraite extends StatelessWidget {
  const ItemProdTraite(this.i);
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 2,
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(6),
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${produits[i].nom}"),
                      Text(
                          "Quantité : ${produits[i].qte} ${produits[i].unite} "),
                    ],
                  ),
                ),
                /*Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(28)),
                          child: Icon(Icons.add)),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(28)),
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
