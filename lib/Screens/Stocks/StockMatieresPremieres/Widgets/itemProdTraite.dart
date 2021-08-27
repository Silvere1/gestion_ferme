import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/renameProduit.dart';

class ItemProdTraite extends StatelessWidget {
  const ItemProdTraite(this.produit);
  final Produit produit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
            spreadRadius: 0.1,
          )
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 0.9,
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
                      Text(
                        "${produit.nom}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("Quantité : ${produit.qte} ${produit.unite} "),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((BuildContext _) {
                              return RenameProduit(produit);
                            }));
                      },
                      child: Container(
                          height: 42,
                          width: 42,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(28)),
                          child: SvgPicture.asset("assets/icons/rename.svg")),
                    ),
                    /*InkWell(
                      onTap: () {},
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(28)),
                        child: Icon(Icons.remove),
                      ),
                    ),*/
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
