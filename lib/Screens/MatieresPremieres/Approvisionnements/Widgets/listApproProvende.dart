import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Widgets/itemApproProvende.dart';
import 'package:get/get.dart';

class ListApproProvende extends StatefulWidget {
  const ListApproProvende(this.pageController);
  final PageController pageController;

  @override
  _ListApproProvendeState createState() =>
      _ListApproProvendeState(pageController);
}

class _ListApproProvendeState extends State<ListApproProvende> {
  final PageController pageController;
  ApproController controller = Get.find();

  _ListApproProvendeState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: Column(
        children: [
          /*Container(
            height: 50,
            width: Get.width,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list),
                ),
                Text("Filtre")
              ],
            ),
          ),*/
          Expanded(
            child: FutureBuilder(
                future: controller.getListApproProvende(),
                builder: (_, snapshot) {
                  return snapshot.hasData
                      ? Obx(
                          () => controller.listApproProvendes.length != 0
                              ? ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount:
                                      controller.listApproProvendes.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) =>
                                      ItemApproProvende(
                                          controller.listApproProvendes[i]),
                                )
                              : Center(
                                  child: Text(
                                    "Aucun approvisionnement n'est encore effectué !",
                                    textAlign: TextAlign.center,
                                  ),
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
