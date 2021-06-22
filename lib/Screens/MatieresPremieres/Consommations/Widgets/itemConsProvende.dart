import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/consomProvendeModel.dart';

class ItemConsProvende extends StatelessWidget {
  const ItemConsProvende(this.i);
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
                      "Consomation N°: ${consomprovende[i].num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Effectué le ${consomprovende[i].dateTime.day}/"
                      "${consomprovende[i].dateTime.month}/"
                      "${consomprovende[i].dateTime.year}",
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
                      "Lot N° : ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text("${consomprovende[i].lot.num}")
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Provende : ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text("${consomprovende[i].provende.nom}")
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Quantité : ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                        "${consomprovende[i].qte} ${consomprovende[i].provende.unite}")
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
