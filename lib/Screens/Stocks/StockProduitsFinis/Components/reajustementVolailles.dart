import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/editStockVolailleModel.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Widgets/itemReajustementVolailles.dart';
import 'package:get/get.dart';

import 'newReajustementVolailles.dart';

class ReajustementVolailles extends StatefulWidget {
  const ReajustementVolailles();

  @override
  _ReajustementVolaillesState createState() => _ReajustementVolaillesState();
}

class _ReajustementVolaillesState extends State<ReajustementVolailles> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Réajustements Volailles"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          physics: BouncingScrollPhysics(),
          itemCount: editstockvolailles.length,
          itemBuilder: (context, i) => ItemReajustementVolailles(i),
        ),
        floatingActionButton: FloatingActionButton(
          focusColor: Theme.of(context).primaryColor,
          onPressed: () {
            Get.to(() => NewReajustementVolailles());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
