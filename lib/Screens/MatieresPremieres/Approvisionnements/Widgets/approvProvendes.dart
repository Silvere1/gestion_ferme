import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Components/addProvende.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Widgets/listProvende.dart';
import 'package:get/get.dart';

import 'listApproProvende.dart';

class ApproProvendes extends StatefulWidget {
  const ApproProvendes();

  @override
  _ApproProvendesState createState() => _ApproProvendesState();
}

class _ApproProvendesState extends State<ApproProvendes> {
  ApproController controller = Get.find();
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
        ListApproProvende(pageController),
        ListProvende(pageController),
        AddProvende(pageController),
      ],
    );
  }
}
