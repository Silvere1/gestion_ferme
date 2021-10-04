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
      backgroundColor: Color(0xffeeeeee),
      body: FutureBuilder(
          future: controller.getListVenteVolailles(),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? Obx(
                    () => controller.listVenteVolailles.length != 0
                        ? ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.listVenteVolailles.length,
                            itemBuilder: (context, i) => ItemVenteVolailles(
                                controller.listVenteVolailles[i]),
                          )
                        : Center(
                            child: Text(
                              "Aucune vente de volaille n'est encore effectuée !",
                              textAlign: TextAlign.center,
                            ),
                          ),
                  )
                : Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await controller.clearData();
            pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutCirc);
          },
          child: Icon(Icons.add)),
    );
  }
}
