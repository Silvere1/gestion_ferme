import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/lotModel.dart';

class ItemArchive extends StatelessWidget {
  const ItemArchive(this.lot);
  final Lot lot;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lot N°: ${lot.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${lot.archive == 2 ? "Supprimé" : "Archivé"}" +
                          " le ${lot.archiveAt.day}/${lot.archiveAt.month}/${lot.archiveAt.year}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Nombre de volailles : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${lot.nmbrVolauillles}"),
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
