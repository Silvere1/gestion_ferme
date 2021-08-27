import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/consomProvendeModel.dart';

class ItemConsProvende extends StatelessWidget {
  const ItemConsProvende(this.consomProvende);
  final ConsomProvende consomProvende;

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
        borderRadius: BorderRadius.circular(5),
        elevation: 0.9,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
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
                      "Alimentation N°: ${consomProvende.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Effectué le ${consomProvende.dateTime.day}/"
                      "${consomProvende.dateTime.month}/"
                      "${consomProvende.dateTime.year}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "Lot N° : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${consomProvende.lot.num}")
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text(
                      "Provende : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${consomProvende.provende.nom}")
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Quantité : ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                              "${consomProvende.qte} ${consomProvende.provende.unite}")
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("Service "),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "${consomProvende.orderService}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
