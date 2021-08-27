import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/usageController.dart';
import 'package:get/get.dart';

import 'itemUsageOeufs.dart';

class ListUsageOeufs extends StatefulWidget {
  const ListUsageOeufs(this.pageController);
  final PageController pageController;

  @override
  _ListUsageOeufsState createState() => _ListUsageOeufsState(pageController);
}

class _ListUsageOeufsState extends State<ListUsageOeufs> {
  UsageController controller = Get.find();
  final PageController pageController;

  _ListUsageOeufsState(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: FutureBuilder(
          future: controller.getListUsedOeuf(),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? Obx(
                    () => controller.listUsedOeufs.length != 0
                        ? ListView.builder(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.listUsedOeufs.length,
                            itemBuilder: (context, i) =>
                                ItemUsageOeufs(controller.listUsedOeufs[i]),
                          )
                        : Center(
                            child: Text(
                            "Aucun usage d'oeuf n'est encore enregistré !",
                            textAlign: TextAlign.center,
                          )),
                  )
                : Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutCirc);
          },
          child: Icon(Icons.add)),
    );
  }
}
