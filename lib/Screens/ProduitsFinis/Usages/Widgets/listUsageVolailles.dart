import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';
import 'package:get/get.dart';

import 'itemUsageVolailles.dart';

class ListUsageVolailles extends StatefulWidget {
  const ListUsageVolailles(this.pageController);
  final PageController pageController;

  @override
  _ListUsageVolaillesState createState() =>
      _ListUsageVolaillesState(pageController);
}

class _ListUsageVolaillesState extends State<ListUsageVolailles> {
  UsageController controller = Get.find();
  final PageController pageController;

  _ListUsageVolaillesState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: FutureBuilder(
          future: controller.getListUsedVolailles(),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? Obx(() => controller.listUsedVolailles.length != 0
                    ? ListView.builder(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.listUsedVolailles.length,
                        itemBuilder: (context, i) =>
                            ItemUsageVolailles(controller.listUsedVolailles[i]),
                      )
                    : Center(
                        child: Text(
                        "Aucun usage de volailles n'est encore enregistré !",
                        textAlign: TextAlign.center,
                      )))
                : Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutCirc);
          },
          child: Icon(Icons.add)),
    );
  }
}
