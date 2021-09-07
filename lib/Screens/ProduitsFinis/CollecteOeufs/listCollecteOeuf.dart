import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
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
  CollecteOeufsController controller = Get.find();
  AddLotController lotController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: FutureBuilder(
          future: controller.getListCollecte(),
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData
                ? Obx(
                    () => controller.listCollecteOuf.length != 0
                        ? ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.listCollecteOuf.length,
                            itemBuilder: (context, i) => ItemOeufCollection(i),
                          )
                        : Center(
                            child: Text(
                                "Aucune collecte n'est encore effectuée !"),
                          ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controller.date.value = "Date";
          controller.newListCollect.clear();
          controller.itemLotCollect.clear();
          Get.to(() => CollecteOeufs());
        },
        splashColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
