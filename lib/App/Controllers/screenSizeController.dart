import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/dTitleModel.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  var _globalKey = GlobalKey<ScaffoldState>().obs;
  var isSelectedMenuItem = false.obs;
  var initialPage = 0.obs;
  var tolBarTitle = "Tableau de bord".obs;
  void controlMenu() {
    if (!_globalKey.value.currentState!.isDrawerOpen) {
      _globalKey.value.currentState!.openDrawer();
    }
  }

  Future<void> selectedItem(int i, int j, int index, String title) async {
    initialPage.value = index;
    tolBarTitle.value = title;
    for (int t = 0; t < titres.length; t++) {
      titres[t].subtitle.forEach((e) {
        e.selected = false;
      });
    }
    titres.forEach((e) {
      e.selected = false;
    });
    titres[i].selected = true;
    titres[i].subtitle[j].selected = true;
  }
}

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1100) {
      return desktop;
    } else if (_size.width >= 850 && _size.width < 1100) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
