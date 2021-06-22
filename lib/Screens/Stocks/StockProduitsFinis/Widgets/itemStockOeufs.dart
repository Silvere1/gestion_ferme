import 'package:flutter/material.dart';

class ItemStockOeufs extends StatelessWidget {
  const ItemStockOeufs();

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
                      "Lot N°: 1",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Collecté le 12/05/2021",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
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
                        Text("XXX"),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Moyens : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("XXX"),
                      ],
                    )),
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
                        Text("XXX"),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          "Fêlés : ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("XXX"),
                      ],
                    )),
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
