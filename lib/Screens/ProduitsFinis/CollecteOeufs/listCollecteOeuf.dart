import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:get/get.dart';

import 'Widgets/itemOeufCollection.dart';
import 'collecteOeufs.dart';

class ListCollecteOeuf extends StatefulWidget {
  const ListCollecteOeuf({Key? key}) : super(key: key);

  @override
  _ListCollecteOeufState createState() => _ListCollecteOeufState();
}

class _ListCollecteOeufState extends State<ListCollecteOeuf> {
  CollecteOeufsController controller = Get.put(CollecteOeufsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(() => controller.listCollecteOuf.length != 0
            ? ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                physics: BouncingScrollPhysics(),
                itemCount: controller.listCollecteOuf.length,
                itemBuilder: (context, i) => ItemOeufCollection(i),
              )
            : Container()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CollecteOeufs());
        },
        splashColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
