import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:get/get.dart';

class NewConsEau extends StatefulWidget {
  const NewConsEau(this.pageController);
  final PageController pageController;

  @override
  _NewConsEauState createState() => _NewConsEauState(pageController);
}

class _NewConsEauState extends State<NewConsEau> {
  final PageController pageController;
  _NewConsEauState(this.pageController);
  bool all = false;
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
        Container(
          height: 50,
          width: Get.width,
          color: Color(0xfffafafa),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 26),
                child: Checkbox(
                  value: all,
                  onChanged: (value) {
                    all = value!;
                    lots.forEach((e) {
                      e.select = value;
                    });
                    setState(() {});
                  },
                ),
              ),
              Text("Sélectionner tout")
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: lots.length,
            itemBuilder: (context, i) => Container(
              margin: EdgeInsets.only(top: 6, left: 10, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                elevation: 2,
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: lots[i].select,
                  onChanged: (value) {
                    setState(() {
                      lots[i].select = value!;
                    });
                  },
                  title: Container(
                    child: Container(
                      height: 60,
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.only(
                          top: 8, bottom: 8, left: 18, right: 18),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1, child: Text("Lot N°: ${lots[i].num}")),
                          lots[i].select ? Text("Qté : ") : Container(),
                          lots[i].select
                              ? Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      //controller.nmbrEditing(int.parse(value));
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 80,
          constraints: BoxConstraints(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: Get.width - 50,
                child: ElevatedButton(
                  onPressed: () {
                    lots.forEach((e) {
                      e.select = false;
                    });
                    all = false;
                    setState(() {});
                    Get.defaultDialog(
                      title: "Succès",
                      content: Text("Données enregistrées !"),
                      radius: 5,
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Get.back();
                              pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOutBack);
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
        )
      ],
    );
  }
}
