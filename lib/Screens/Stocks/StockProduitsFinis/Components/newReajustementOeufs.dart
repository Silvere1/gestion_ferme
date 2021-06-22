import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewReajustementOeufs extends StatefulWidget {
  const NewReajustementOeufs();

  @override
  _NewReajustementOeufsState createState() => _NewReajustementOeufsState();
}

class _NewReajustementOeufsState extends State<NewReajustementOeufs> {
  bool uni = true;
  bool plus = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Nouvel réajustement Oeufs"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                                value: uni,
                                onChanged: (value) {
                                  uni = value!;
                                  plus = !uni;
                                  setState(() {});
                                }),
                            Text("En défaut"),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                                value: plus,
                                onChanged: (value) {
                                  plus = value!;
                                  uni = !plus;
                                  setState(() {});
                                }),
                            Text("En excès"),
                          ],
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: 40,
                width: Get.width - 40,
                child: ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Succès",
                      content: Text("Données enregistrées !"),
                      radius: 5,
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Get.back();
                              Get.back();
                            },
                            child: Text("Ok"))
                      ],
                    );
                  },
                  child: Text("Enregistrer"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
