import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/archiveModel.dart';

class ItemArchive extends StatelessWidget {
  const ItemArchive(this.i);
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        elevation: 2,
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
                      "Lot N°: ${archives[i].lot.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${archives[i].isdeleted ? "Supprimé" : "Archivé"}" +
                          " le ${archives[i].dateTime.day}/${archives[i].dateTime.month}/${archives[i].dateTime.year}",
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
                    Text("${archives[i].lot.nmbrVolauillles}"),
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
