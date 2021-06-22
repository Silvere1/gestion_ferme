import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Components/addProdTraite.dart';
import 'package:get/get.dart';

import 'itemProdTraite.dart';

class ApprovProdTraite extends StatefulWidget {
  const ApprovProdTraite({Key? key}) : super(key: key);

  @override
  _ApprovProdTraiteState createState() => _ApprovProdTraiteState();
}

class _ApprovProdTraiteState extends State<ApprovProdTraite> {
  ApproController controller = Get.put(ApproController());
  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Column(
          children: [
            Container(
              height: 50,
              width: Get.width,
              color: Color(0xfffafafa),
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
              child: Obx(() => controller.listProdTraite.length != 0
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.listProdTraite.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) =>
                          ItemProdTraite(controller, i, pageController),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
            ),
          ],
        ),
        AddProdTraite(pageController),
      ],
    );
  }
}
