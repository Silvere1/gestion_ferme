import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:get/get.dart';

import 'Widgets/itemArchive.dart';

class Archives extends StatefulWidget {
  const Archives();

  @override
  _ArchivesState createState() => _ArchivesState();
}

class _ArchivesState extends State<Archives> {
  AddLotController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      child: FutureBuilder(
          future: controller.getAechiveLotsList(),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? Obx(
                    () => controller.archiveListLot.length != 0
                        ? ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.archiveListLot.length,
                            itemBuilder: (context, i) =>
                                ItemArchive(controller.archiveListLot[i]),
                          )
                        : Center(
                            child: Text(
                              "Aucun lot de volailles n'est encore archivé!",
                              textAlign: TextAlign.center,
                            ),
                          ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
