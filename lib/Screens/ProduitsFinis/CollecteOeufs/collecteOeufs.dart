import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:get/get.dart';

import 'Widgets/header.dart';
import 'Widgets/itemLotCollected.dart';

class CollecteOeufs extends StatefulWidget {
  const CollecteOeufs();

  @override
  _CollecteOeufsState createState() => _CollecteOeufsState();
}

class _CollecteOeufsState extends State<CollecteOeufs> {
  CollecteOeufsController controller = Get.find();
  AddLotController lotController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
        title: Text("Nouvelle collecte d'oeufs"),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Header(controller: controller),
          Expanded(
            child: Obx(
              () => controller.itemLotCollect.length != 0
                  ? ListView.builder(
                      itemCount: controller.itemLotCollect.length,
                      itemBuilder: (context, i) => ItemLotCollected(
                          i,
                          new TextEditingController(),
                          new TextEditingController(),
                          new TextEditingController(),
                          new TextEditingController(),
                          new TextEditingController(),
                          new TextEditingController(),
                          new TextEditingController(),
                          new TextEditingController()))
                  : Center(
                      child:
                          Text("Sélectionner un lot pour faire sa collecte!"),
                    ),
            ),
          ),
          Container(
            height: 80,
            constraints: BoxConstraints(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: Get.width - 50,
                  child: Obx(() => ElevatedButton(
                        onPressed: controller.isValide.value &&
                                controller.date.value != "Date" &&
                                controller.newListCollect.length != 0
                            ? () async {
                                await controller.saveCollecteOeuf();
                                Get.back();
                              }
                            : null,
                        child: Text("Enregistrer"),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
