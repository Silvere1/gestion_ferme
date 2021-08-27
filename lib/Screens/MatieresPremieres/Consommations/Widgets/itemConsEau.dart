import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/consomEauModel.dart';

class ItemConsEau extends StatelessWidget {
  const ItemConsEau(this._consomEau);
  final ConsomEau _consomEau;

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
                      "Alimentation N°: ${_consomEau.num}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Effectué le ${_consomEau.dateTime.day}/"
                      "${_consomEau.dateTime.month}/"
                      "${_consomEau.dateTime.year}",
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
                    Text("${_consomEau.lot.num}")
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "Quantité : ",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("${_consomEau.qte} l")
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
