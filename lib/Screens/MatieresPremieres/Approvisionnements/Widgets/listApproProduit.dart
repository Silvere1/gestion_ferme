import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:get/get.dart';

import 'itemApproProduit.dart';

class ListApproProduit extends StatefulWidget {
  const ListApproProduit(this.pageController);
  final PageController pageController;

  @override
  _ListApproProduitState createState() =>
      _ListApproProduitState(pageController);
}

class _ListApproProduitState extends State<ListApproProduit> {
  final PageController pageController;
  ApproController controller = Get.find();

  _ListApproProduitState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: Column(
        children: [
          Container(
            height: 50,
            width: Get.width,
            /*color: Color(0xfffafafa),*/
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list),
                ),
                Text("Filtre")
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: controller.getListApproProduit(),
                builder: (_, snapshot) {
                  return snapshot.hasData
                      ? Obx(
                          () => controller.listApproProdTraite.length != 0
                              ? ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                      controller.listApproProdTraite.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) => ItemApproProduit(
                                      controller.listApproProdTraite[i]),
                                )
                              : Center(
                                  child: Text(
                                      "Aucun approvisionnement n'est encore effectué !"),
                                ),
                        )
                      : Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
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
