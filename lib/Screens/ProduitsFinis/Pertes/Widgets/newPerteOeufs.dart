import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPerteOeufs extends StatefulWidget {
  const NewPerteOeufs(this.pageController);
  final PageController pageController;

  @override
  _NewPerteOeufsState createState() => _NewPerteOeufsState(pageController);
}

class _NewPerteOeufsState extends State<NewPerteOeufs> {
  final PageController pageController;

  _NewPerteOeufsState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                elevation: 1,
                child: Container(
                  margin: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 55,
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text("Petits"),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                style: TextStyle(fontSize: 16),
                                onChanged: (value) {
                                  //controller.nmbrEditing(int.parse(value));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 55,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text("Moyens"),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                style: TextStyle(fontSize: 16),
                                onChanged: (value) {
                                  //controller.nmbrEditing(int.parse(value));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 55,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text("Grands"),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                style: TextStyle(fontSize: 16),
                                onChanged: (value) {
                                  //controller.nmbrEditing(int.parse(value));
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          child: Text("Total : XXXX")),
                      Container(
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text("Motif")),
                      Container(
                        child: TextFormField(
                          style: TextStyle(fontSize: 16),
                          onChanged: (value) {
                            //controller.nmbrEditing(int.parse(value));
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 80,
          constraints: BoxConstraints(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: Get.width - 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Succès",
                      content: Text("Données enregistrées !"),
                      radius: 5,
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              //controller.itemLotCollect.value = [];
                              Get.back();
                            },
                            child: Text("Ok"))
                      ],
                    );
                  },
                  child: Text("Enregistrer"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
