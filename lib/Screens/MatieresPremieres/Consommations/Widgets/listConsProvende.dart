import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:get/get.dart';

import 'itemConsProvende.dart';

class ListConsProvende extends StatelessWidget {
  const ListConsProvende(this.pageController, this.controller);
  final PageController pageController;
  final ConsommationController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: FutureBuilder(
          future: controller.getListConsProvende(),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? Obx(
                    () => controller.listConsProvende.length != 0
                        ? ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.listConsProvende.length,
                            itemBuilder: (context, i) => ItemConsProvende(
                                controller.listConsProvende[i]),
                          )
                        : Center(
                            child: Text(
                              "Aucune Alimentation en provende n'est encore effectuée !",
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
              duration: Duration(milliseconds: 300), curve: Curves.easeOutCirc);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
