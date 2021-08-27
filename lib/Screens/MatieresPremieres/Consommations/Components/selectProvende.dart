import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/Widgets/itemProvende.dart';
import 'package:get/get.dart';

class SelectProvende extends StatefulWidget {
  const SelectProvende(this.title, this.pageController);
  final String title;
  final PageController pageController;

  @override
  _SelectProvendeState createState() =>
      _SelectProvendeState(title, pageController);
}

class _SelectProvendeState extends State<SelectProvende> {
  ApproController approController = Get.find();
  ConsommationController controller = Get.find();
  final String title;
  final PageController pageController;
  _SelectProvendeState(this.title, this.pageController);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: approController.getListProvende(),
            builder: (_, snapshot) {
              return snapshot.hasData
                  ? Obx(
                      () => approController.listProvendes.length != 0
                          ? ListView.builder(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              physics: BouncingScrollPhysics(),
                              itemCount: approController.listProvendes.length,
                              itemBuilder: (context, i) => ItemProvende(
                                  approController.listProvendes[i],
                                  controller,
                                  pageController),
                            )
                          : Center(
                              child: Text(
                                "Aucune provende n'est disponible\n pour être consommée !",
                                textAlign: TextAlign.center,
                              ),
                            ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }
}
