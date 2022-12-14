import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/perteController.dart';
import 'package:get/get.dart';

import 'itemPerteVolailles.dart';

class ListPerteVolailles extends StatefulWidget {
  const ListPerteVolailles(this.pageController);
  final PageController pageController;

  @override
  _ListPerteVolaillesState createState() =>
      _ListPerteVolaillesState(pageController);
}

class _ListPerteVolaillesState extends State<ListPerteVolailles> {
  final PageController pageController;
  PerteController controller = Get.find();

  _ListPerteVolaillesState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: FutureBuilder(
          future: controller.getListPerteVolailles(),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? Obx(
                    () => controller.listPerteVolailles.length != 0
                        ? ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.listPerteVolailles.length,
                            itemBuilder: (context, i) => ItemPerteVolailles(
                              controller.listPerteVolailles[i],
                            ),
                          )
                        : Center(
                            child: Text(
                              "Aucune Perte de volailles n'est encore déclarée !",
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
            pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutCirc);
          },
          child: Icon(Icons.add)),
    );
  }
}
