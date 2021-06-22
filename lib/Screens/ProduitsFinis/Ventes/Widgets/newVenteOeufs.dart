import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewVenteOeufs extends StatefulWidget {
  const NewVenteOeufs(this.pageController);
  final PageController pageController;

  @override
  _NewVenteOeufsState createState() => _NewVenteOeufsState(pageController);
}

class _NewVenteOeufsState extends State<NewVenteOeufs> {
  final PageController pageController;

  _NewVenteOeufsState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.all(18),
                    height: 150,
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Stock Oeufs"),
                        Text("Petits : 1990"),
                        Text("Moyens : 740"),
                        Text("Grand : 230"),
                        Text("Total : 2960"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("Nouvelle vente")),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  elevation: 0.9,
                  child: Container(
                    margin: EdgeInsets.only(left: 4, right: 4, bottom: 4),
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
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
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
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
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
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
                          height: 55,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text("Montant"),
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 75,
          constraints: BoxConstraints(),
          margin: EdgeInsets.only(bottom: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 28),
                    child: Text("Total : XXX"),
                  ),
                ],
              ),
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
                              pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOutBack);
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
