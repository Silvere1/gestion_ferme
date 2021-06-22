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
      body: Obx(
        () => controller.listPerteOeufs.length != 0
            ? ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                physics: BouncingScrollPhysics(),
                itemCount: controller.listPerteOeufs.length,
                itemBuilder: (context, i) => ItemPerteOeufs(controller, i),
              )
            : Container(),
      ),
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
