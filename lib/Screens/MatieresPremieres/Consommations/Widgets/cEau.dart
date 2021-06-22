import 'package:flutter/material.dart';

import 'listConsEau.dart';
import 'newConsEau.dart';

class CEau extends StatefulWidget {
  const CEau();

  @override
  _CEauState createState() => _CEauState();
}

class _CEauState extends State<CEau> {
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
        ListConsEau(pageController),
        NewConsEau(pageController),
      ],
    );
  }
}
