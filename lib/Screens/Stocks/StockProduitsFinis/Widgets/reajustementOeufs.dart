import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:gestionferme/Screens/Stocks/StockProduitsFinis/Widgets/itemReajustementOeufs.dart';
import 'package:get/get.dart';

import 'newReajustementOeufs.dart';

class ReajustementOeufs extends StatefulWidget {
  const ReajustementOeufs();

  @override
  _ReajustementOeufsState createState() => _ReajustementOeufsState();
}

class _ReajustementOeufsState extends State<ReajustementOeufs> {
  EditStockController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          title: Text("Réajustements Oeufs"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: FutureBuilder(
            future: controller.getListEditStkOeuf(),
            builder: (_, snapshot) {
              return snapshot.hasData
                  ? Obx(
                      () => controller.listEditStkOeuf.length != 0
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              itemCount: controller.listEditStkOeuf.length,
                              itemBuilder: (context, i) =>
                                  ItemReajustementOeufs(
                                      controller.listEditStkOeuf[i]),
                            )
                          : Center(
                              child: Text(
                                "Auncun réajustement de ce stock n'est encore effectué !",
                                textAlign: TextAlign.center,
                              ),
                            ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
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
