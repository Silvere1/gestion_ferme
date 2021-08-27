import 'package:flutter/material.dart';

import 'listVenteVolailles.dart';
import 'newVenteVolailles.dart';

class VenteVolailles extends StatefulWidget {
  VenteVolailles();

  @override
  _VenteVolaillesState createState() => _VenteVolaillesState();
}

class _VenteVolaillesState extends State<VenteVolailles> {
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
        ListVenteVolailles(pageController),
        NewVenteVolailles(pageController),
      ],
    );
  }
}
