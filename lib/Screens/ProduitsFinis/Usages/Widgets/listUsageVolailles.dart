import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';

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
      body: Obx(
        () => controller.listUsageVolailles.length != 0
            ? ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                physics: BouncingScrollPhysics(),
                itemCount: controller.listUsageVolailles.length,
                itemBuilder: (context, i) => ItemUsageVolailles(controller, i),
              )
            : Container(),
      ),
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
