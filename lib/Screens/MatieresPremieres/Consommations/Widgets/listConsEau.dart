import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/consomEauModel.dart';

import 'itemConsEau.dart';

class ListConsEau extends StatelessWidget {
  const ListConsEau(this.pageController);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        itemCount: consomeau.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, i) => ItemConsEau(i),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.easeOutCirc);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
