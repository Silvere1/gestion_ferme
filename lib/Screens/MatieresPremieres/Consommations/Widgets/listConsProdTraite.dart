import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/consomProdTraiteModel.dart';

import 'itemConsProdTraite.dart';

class ListConsProdTraite extends StatelessWidget {
  const ListConsProdTraite(this.pageController);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        physics: BouncingScrollPhysics(),
        itemCount: consomprodtraite.length,
        itemBuilder: (context, i) => ItemConsProdTraite(i),
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
