import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/editStockOeufModel.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Widgets/itemReajustementOeufs.dart';
import 'package:get/get.dart';

import 'newReajustementOeufs.dart';

class ReajustementOeufs extends StatefulWidget {
  const ReajustementOeufs();

  @override
  _ReajustementOeufsState createState() => _ReajustementOeufsState();
}

class _ReajustementOeufsState extends State<ReajustementOeufs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Réajustements Oeufs"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 10, bottom: 20),
          itemCount: editstockoeuf.length,
          itemBuilder: (context, i) => ItemReajustementOeufs(i),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => NewReajustementOeufs());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
