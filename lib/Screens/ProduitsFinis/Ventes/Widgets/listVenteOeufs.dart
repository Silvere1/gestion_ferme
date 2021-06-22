import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/venteController.dart';
import 'package:get/get.dart';

import 'itemVenteOeufs.dart';

class ListVenteOeufs extends StatefulWidget {
  const ListVenteOeufs(this.pageController);
  final PageController pageController;

  @override
  _ListVenteOeufsState createState() => _ListVenteOeufsState(pageController);
}

class _ListVenteOeufsState extends State<ListVenteOeufs> {
  final PageController pageController;
  VenteController controller = Get.find();

  _ListVenteOeufsState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.listVenteOeufs.length != 0
            ? ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                physics: BouncingScrollPhysics(),
                itemCount: controller.listVenteOeufs.length,
                itemBuilder: (context, i) => ItemVenteOeufs(controller, i),
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
