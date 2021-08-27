import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:get/get.dart';

import 'listConsProvende.dart';
import 'newConsProvende.dart';

class CProvende extends StatefulWidget {
  CProvende();

  @override
  _CProvendeState createState() => _CProvendeState();
}

class _CProvendeState extends State<CProvende> {
  PageController pageController = PageController(initialPage: 0);
  ConsommationController controller = Get.find();

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
        ListConsProvende(pageController, controller),
        NewConsProvende(pageController, controller),
      ],
    );
  }
}
