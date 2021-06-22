import 'package:flutter/material.dart';

import 'listUsageOeufs.dart';
import 'newUsageOeufs.dart';

class UsageOeufs extends StatefulWidget {
  const UsageOeufs();

  @override
  _UsageOeufsState createState() => _UsageOeufsState();
}

class _UsageOeufsState extends State<UsageOeufs> {
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
        ListUsageOeufs(pageController),
        NewUsageOeufs(pageController),
      ],
    );
  }
}
