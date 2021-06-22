import 'package:flutter/material.dart';

import 'listConsProvende.dart';
import 'newConsProvende.dart';

class CProvende extends StatefulWidget {
  CProvende();

  @override
  _CProvendeState createState() => _CProvendeState();
}

class _CProvendeState extends State<CProvende> {
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
        ListConsProvende(pageController),
        NewConsProvende(pageController),
      ],
    );
  }
}
