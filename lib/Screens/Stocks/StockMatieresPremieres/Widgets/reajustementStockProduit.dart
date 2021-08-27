import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Widgets/itemReajustementProduit.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Widgets/newReajustementProduit.dart';
import 'package:get/get.dart';

class ReajustementStockProduit extends StatefulWidget {
  const ReajustementStockProduit();

  @override
  _ReajustementStockProduitState createState() =>
      _ReajustementStockProduitState();
}

class _ReajustementStockProduitState extends State<ReajustementStockProduit> {
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
            future: controller.getListEditStockProduit(),
            builder: (_, snapshot) {
              return snapshot.hasData
                  ? Obx(
                      () => controller.listEditStockProduit.length != 0
                          ? ListView.builder(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.listEditStockProduit.length,
                              itemBuilder: (context, i) =>
                                  ItemReajustementProduit(
                                      controller.listEditStockProduit[i]),
                            )
                          : Center(
                              child: Text(
                                "Aucun produit de traitement n'est encore réajusté !",
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
            Get.to(() => NewReajustementProduit());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
