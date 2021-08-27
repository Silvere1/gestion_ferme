import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:get/get.dart';

import 'itemProvende.dart';

class ListProvende extends StatefulWidget {
  ListProvende(this.pageController);
  final PageController pageController;

  @override
  _ListProvendeState createState() => _ListProvendeState(pageController);
}

class _ListProvendeState extends State<ListProvende> {
  final PageController pageController;
  ApproController controller = Get.find();

  _ListProvendeState(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      child: Column(
        children: [
          Container(
            height: 50,
            width: Get.width,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOutBack);
                  },
                  icon: Icon(Icons.close),
                ),

                ///Text("Filtre")
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: controller.getListProvende(),
                builder: (_, snapshot) {
                  return snapshot.hasData
                      ? Obx(
                          () => controller.listProvendes.length != 0
                              ? ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: controller.listProvendes.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) => ItemProvende(
                                      pageController,
                                      controller.listProvendes[i],
                                      controller),
                                )
                              : Center(
                                  child: Text(
                                    "Aucune provende n'est encore disponible"
                                    " pour approvisionner !",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                        )
                      : Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }
}
