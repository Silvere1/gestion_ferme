import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/perteController.dart';
import 'package:get/get.dart';

import 'itemPerteOeufs.dart';

class ListPerteOeufs extends StatefulWidget {
  const ListPerteOeufs(this.pageController);
  final PageController pageController;

  @override
  _ListPerteOeufsState createState() => _ListPerteOeufsState(pageController);
}

class _ListPerteOeufsState extends State<ListPerteOeufs> {
  final PageController pageController;
  PerteController controller = Get.find();

  _ListPerteOeufsState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: FutureBuilder(
          future: controller.getListPerteOeufs(),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? Obx(
                    () => controller.listPerteOeufs.length != 0
                        ? ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.listPerteOeufs.length,
                            itemBuilder: (context, i) =>
                                ItemPerteOeufs(controller.listPerteOeufs[i]),
                          )
                        : Center(
                            child: Text(
                            "Aucune perte d'oeuf n'est encore déclarée !",
                            textAlign: TextAlign.center,
                          )),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutCirc);
          },
          child: Icon(Icons.add)),
    );
  }
}
