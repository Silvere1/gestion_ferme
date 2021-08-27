import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Widgets/itemProdTraite.dart';
import 'package:get/get.dart';

class ListProduit extends StatefulWidget {
  const ListProduit(this.pageController);
  final PageController pageController;

  @override
  _ListProduitState createState() => _ListProduitState(pageController);
}

class _ListProduitState extends State<ListProduit> {
  final PageController pageController;
  ApproController controller = Get.find();

  _ListProduitState(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      child: Column(
        children: [
          Container(
            height: 50,
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
                future: controller.getListProduit(),
                builder: (_, snapshot) {
                  return snapshot.hasData
                      ? Obx(
                          () => controller.listProdTraite.length != 0
                              ? ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: controller.listProdTraite.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) => ItemProdTraite(
                                      controller,
                                      controller.listProdTraite[i],
                                      pageController),
                                )
                              : Center(
                                  child: Text(
                                    "Aucun produit n'est encore disponible "
                                    "pour approvisionner !",
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
