import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Widgets/itemReajustementVolailles.dart';
import 'package:get/get.dart';

import 'newReajustementVolailles.dart';

class ReajustementVolailles extends StatefulWidget {
  const ReajustementVolailles();

  @override
  _ReajustementVolaillesState createState() => _ReajustementVolaillesState();
}

class _ReajustementVolaillesState extends State<ReajustementVolailles> {
  EditStockController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          title: Text("Réajustements Volailles"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: FutureBuilder(
            future: controller.getListEditStkVolaille(),
            builder: (_, snapshot) {
              return snapshot.hasData
                  ? Obx(
                      () => controller.listEditStkVolailles.length != 0
                          ? ListView.builder(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.listEditStkVolailles.length,
                              itemBuilder: (context, i) =>
                                  ItemReajustementVolailles(
                                      controller.listEditStkVolailles[i]),
                            )
                          : Center(
                              child: Text(
                                "Aucun réajustement de lots de volailles n'est encore effectué !",
                                textAlign: TextAlign.center,
                              ),
                            ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
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
