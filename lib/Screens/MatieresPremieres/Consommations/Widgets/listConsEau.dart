import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:get/get.dart';

import 'itemConsEau.dart';

class ListConsEau extends StatelessWidget {
  const ListConsEau(this.pageController, this.controller);
  final PageController pageController;
  final ConsommationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: FutureBuilder(
          future: controller.getListConsEau(),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? Obx(
                    () => controller.listConsEau.length != 0
                        ? ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.listConsEau.length,
                            itemBuilder: (context, i) =>
                                ItemConsEau(controller.listConsEau[i]),
                          )
                        : Center(
                            child: Text(
                              "Aucune Alimentation en eau n'est encore effectuée !",
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
