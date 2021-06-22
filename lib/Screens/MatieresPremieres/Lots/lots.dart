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
  AddLotController controller = Get.put(AddLotController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Container(
        child: Obx(() => controller.listlot.length != 0
            ? ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                physics: BouncingScrollPhysics(),
                itemCount: controller.listlot.length,
                itemBuilder: (context, i) => LotItem(i, controller))
            : Center(
                child: CircularProgressIndicator(),
              )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddLots());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
