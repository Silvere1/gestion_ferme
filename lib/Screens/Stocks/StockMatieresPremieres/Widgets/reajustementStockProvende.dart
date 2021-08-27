import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Widgets/itemReajustementProvende.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Widgets/newReajustementProvende.dart';
import 'package:get/get.dart';

class ReajustementStockProvende extends StatefulWidget {
  const ReajustementStockProvende();

  @override
  _ReajustementStockProvendeState createState() =>
      _ReajustementStockProvendeState();
}

class _ReajustementStockProvendeState extends State<ReajustementStockProvende> {
  EditStockController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          title: Text("Réajustements stock Provende"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: FutureBuilder(
            future: controller.getListEditStockProvende(),
            builder: (_, snapshot) {
              return snapshot.hasData
                  ? Obx(
                      () => controller.listEditStockProvende.length != 0
                          ? ListView.builder(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  controller.listEditStockProvende.length,
                              itemBuilder: (context, i) =>
                                  ItemReajustementProvende(
                                      controller.listEditStockProvende[i]),
                            )
                          : Center(
                              child: Text(
                                "Aucune provende n'est encore réajustée !",
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
            Get.to(() => NewReajustementProvende());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
