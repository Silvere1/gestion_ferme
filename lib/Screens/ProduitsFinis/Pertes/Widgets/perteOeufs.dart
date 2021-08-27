import 'package:flutter/material.dart';

import 'listPerteOeufs.dart';
import 'newPerteOeufs.dart';

class PerteOeufs extends StatefulWidget {
  const PerteOeufs();

  @override
  _PerteOeufsState createState() => _PerteOeufsState();
}

class _PerteOeufsState extends State<PerteOeufs> {
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
        ListPerteOeufs(pageController),
        NewPerteOeufs(pageController),
      ],
    );
  }
}
