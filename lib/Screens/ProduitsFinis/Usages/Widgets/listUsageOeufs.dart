import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';
import 'package:get/get.dart';

import 'itemUsageOeufs.dart';

class ListUsageOeufs extends StatefulWidget {
  const ListUsageOeufs(this.pageController);
  final PageController pageController;

  @override
  _ListUsageOeufsState createState() => _ListUsageOeufsState(pageController);
}

class _ListUsageOeufsState extends State<ListUsageOeufs> {
  UsageController controller = Get.find();
  final PageController pageController;

  _ListUsageOeufsState(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.listUsageOeufs.length != 0
            ? ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                physics: BouncingScrollPhysics(),
                itemCount: controller.listUsageOeufs.length,
                itemBuilder: (context, i) => ItemUsageOeufs(controller, i),
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
