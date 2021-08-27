import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:get/get.dart';

import 'listConsEau.dart';
import 'newConsEau.dart';

class CEau extends StatefulWidget {
  const CEau();

  @override
  _CEauState createState() => _CEauState();
}

class _CEauState extends State<CEau> {
  ConsommationController controller = Get.find();
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
        ListConsEau(pageController, controller),
        NewConsEau(pageController),
      ],
    );
  }
}
