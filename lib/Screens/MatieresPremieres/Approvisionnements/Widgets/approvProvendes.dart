import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Components/addProvende.dart';
import 'package:get/get.dart';

import 'itemProvende.dart';

class ApproProvendes extends StatefulWidget {
  const ApproProvendes({Key? key}) : super(key: key);

  @override
  _ApproProvendesState createState() => _ApproProvendesState();
}

class _ApproProvendesState extends State<ApproProvendes> {
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
              child: Obx(() => controller.listProvendes.length != 0
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.listProvendes.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) =>
                          ItemProvende(controller, i, pageController))
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
            ),
          ],
        ),
        AddProvende(pageController),
      ],
    );
  }
}
