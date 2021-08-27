import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/perteOeufsModel.dart';

class ItemPerteOeufs extends StatelessWidget {
  const ItemPerteOeufs(this.perteOeufs);
  final PerteOeufs perteOeufs;

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
                      "Perte Oeufs N°: ${perteOeufs.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Déclarée le ${perteOeufs.dateTime.day}/"
                      "${perteOeufs.dateTime.month}/"
                      "${perteOeufs.dateTime.year}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Petits : ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text("${perteOeufs.petits}"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Moyens : ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text("${perteOeufs.moyens}"),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Grands : ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text("${perteOeufs.grands}"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Total : ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                              "${perteOeufs.petits + perteOeufs.moyens + perteOeufs.grands}"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "Motif : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${perteOeufs.motif}")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
