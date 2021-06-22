import 'package:flutter/material.dart';

import 'listConsProdTraite.dart';
import 'newConsProdTraite.dart';

class CTraitement extends StatefulWidget {
  const CTraitement();

  @override
  _CTraitementState createState() => _CTraitementState();
}

class _CTraitementState extends State<CTraitement> {
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
        ListConsProdTraite(pageController),
        NewConsProdTraite(pageController),
      ],
    );
  }
}
