import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/venteController.dart';
import 'package:get/get.dart';

import 'itemVenteVolailles.dart';

class ListVenteVolailles extends StatefulWidget {
  const ListVenteVolailles(this.pageController);
  final PageController pageController;

  @override
  _ListVenteVolaillesState createState() =>
      _ListVenteVolaillesState(pageController);
}

class _ListVenteVolaillesState extends State<ListVenteVolailles> {
  final PageController pageController;
  VenteController controller = Get.find();

  _ListVenteVolaillesState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.listVenteVolailles.length != 0
            ? ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                physics: BouncingScrollPhysics(),
                itemCount: controller.listVenteVolailles.length,
                itemBuilder: (context, i) => ItemVenteVolailles(controller, i),
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
