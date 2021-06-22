import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/perteController.dart';
import 'package:get/get.dart';

import 'listPerteVolailles.dart';
import 'newPerteVolailles.dart';

class PerteVolailles extends StatefulWidget {
  const PerteVolailles();

  @override
  _PerteVolaillesState createState() => _PerteVolaillesState();
}

class _PerteVolaillesState extends State<PerteVolailles> {
  PageController pageController = PageController(initialPage: 0);
  PerteController controller = Get.put(PerteController());

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
        ListPerteVolailles(pageController),
        NewPerteVolailles(pageController),
      ],
    );
  }
}
