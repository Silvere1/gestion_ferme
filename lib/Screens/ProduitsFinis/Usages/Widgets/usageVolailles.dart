import 'package:flutter/material.dart';

import 'listUsageVolailles.dart';
import 'newUsageVolailles.dart';

class UsageVolailles extends StatefulWidget {
  const UsageVolailles();

  @override
  _UsageVolaillesState createState() => _UsageVolaillesState();
}

class _UsageVolaillesState extends State<UsageVolailles> {
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
        ListUsageVolailles(pageController),
        NewUsageVolailles(pageController),
      ],
    );
  }
}
