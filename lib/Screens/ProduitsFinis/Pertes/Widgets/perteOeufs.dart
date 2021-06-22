import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/perteController.dart';
import 'package:get/get.dart';

import 'listPerteOeufs.dart';
import 'newPerteOeufs.dart';

class PerteOeufs extends StatefulWidget {
  const PerteOeufs();

  @override
  _PerteOeufsState createState() => _PerteOeufsState();
}

class _PerteOeufsState extends State<PerteOeufs> {
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
        ListPerteOeufs(pageController),
        NewPerteOeufs(pageController),
      ],
    );
  }
}
