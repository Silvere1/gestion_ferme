import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';

import 'itemProdTraite.dart';

class NewConsProdTraite extends StatelessWidget {
  const NewConsProdTraite(this.pageController);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 4),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOutBack);
                },
                icon: Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemCount: provendes.length,
          shrinkWrap: true,
          itemBuilder: (context, i) => ItemProdTraite(i),
        ),
      ],
    );
  }
}
