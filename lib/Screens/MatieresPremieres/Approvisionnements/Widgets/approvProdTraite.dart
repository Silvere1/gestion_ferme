import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Components/addProdTraite.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Widgets/listApproProduit.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Approvisionnements/Widgets/listProduit.dart';
import 'package:get/get.dart';

class ApprovProdTraite extends StatefulWidget {
  const ApprovProdTraite({Key? key}) : super(key: key);

  @override
  _ApprovProdTraiteState createState() => _ApprovProdTraiteState();
}

class _ApprovProdTraiteState extends State<ApprovProdTraite> {
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
        ListApproProduit(pageController),
        ListProduit(pageController),
        AddProdTraite(pageController),
      ],
    );
  }
}
