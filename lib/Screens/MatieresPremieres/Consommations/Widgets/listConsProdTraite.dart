import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:get/get.dart';

import 'itemConsProdTraite.dart';

class ListConsProdTraite extends StatelessWidget {
  const ListConsProdTraite(this.pageController, this.controller);
  final PageController pageController;
  final ConsommationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: FutureBuilder(
          future: controller.getListConsProduit(),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? Obx(
                    () => controller.listConsProduit.length != 0
                        ? ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.listConsProduit.length,
                            itemBuilder: (_, i) => ItemConsProdTraite(
                                controller.listConsProduit[i]),
                          )
                        : Center(
                            child: Text(
                              "Aucun traitement de volailles\n n'est encore effectué !",
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
