import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:get/get.dart';

import 'Widgets/itemLot.dart';
import 'addLots.dart';

class Lots extends StatefulWidget {
  Lots();

  @override
  _LotsState createState() => _LotsState();
}

class _LotsState extends State<Lots> {
  AddLotController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lots de volailles"),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xffeeeeee),
      body: Container(
        child: FutureBuilder(
            future: controller.getListLots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? Obx(() => controller.listlot.length != 0
                      ? ListView.builder(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.listlot.length,
                          itemBuilder: (context, i) =>
                              LotItem(controller.listlot[i]))
                      : Center(
                          child: Text("La liste de lots est vide !"),
                        ))
                  : Center(child: CircularProgressIndicator());
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.resetWdgets();
          Get.to(() => AddLots());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
