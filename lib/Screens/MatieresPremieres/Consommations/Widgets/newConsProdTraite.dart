import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:get/get.dart';

import 'itemProdTraite.dart';

class NewConsProdTraite extends StatelessWidget {
  const NewConsProdTraite(this.pageController, this.approController);
  final PageController pageController;
  final ApproController approController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 4),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOutBack);
                },
                icon: Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: approController.getListProduit(),
              builder: (_, snapshot) {
                return snapshot.hasData
                    ? Obx(
                        () => approController.listProdTraite.length != 0
                            ? ListView.builder(
                                padding: EdgeInsets.only(top: 0, bottom: 20),
                                physics: BouncingScrollPhysics(),
                                itemCount:
                                    approController.listProdTraite.length,
                                itemBuilder: (context, i) => ItemProdTraite(
                                    approController.listProdTraite[i],
                                    pageController),
                              )
                            : Center(
                                child: Text(
                                  "Aucun produit de traitement n'est disponible\n pour être consommé !",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
        ),
      ],
    );
  }
}
