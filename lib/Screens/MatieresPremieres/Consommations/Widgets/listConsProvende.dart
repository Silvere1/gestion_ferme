import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/consomProvendeModel.dart';

import 'itemConsProvende.dart';

class ListConsProvende extends StatelessWidget {
  const ListConsProvende(this.pageController);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        physics: BouncingScrollPhysics(),
        itemCount: consomprovende.length,
        itemBuilder: (context, i) => ItemConsProvende(i),
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
