import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/venteController.dart';
import 'package:get/get.dart';

import 'listVenteOeufs.dart';
import 'newVenteOeufs.dart';

class VenteOeufs extends StatefulWidget {
  VenteOeufs();

  @override
  _VenteOeufsState createState() => _VenteOeufsState();
}

class _VenteOeufsState extends State<VenteOeufs> {
  PageController pageController = PageController(initialPage: 0);
  VenteController controller = Get.put(VenteController());

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
        ListVenteOeufs(pageController),
        NewVenteOeufs(pageController),
      ],
    );
  }
}
