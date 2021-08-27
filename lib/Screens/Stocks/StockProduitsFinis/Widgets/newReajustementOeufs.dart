import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/editStockController.dart';
import 'package:get/get.dart';

class NewReajustementOeufs extends StatefulWidget {
  const NewReajustementOeufs();

  @override
  _NewReajustementOeufsState createState() => _NewReajustementOeufsState();
}

class _NewReajustementOeufsState extends State<NewReajustementOeufs> {
  EditStockController controller = Get.find();
  var text1 = TextEditingController();
  var text2 = TextEditingController();
  var text3 = TextEditingController();
  /* bool uni = true;
  bool plus = false;*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
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
                /* Container(
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
                ),*/
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1,
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    elevation: 0.9,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 55,
                            margin: EdgeInsets.only(top: 4),
                            padding: EdgeInsets.all(8),
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
                                    controller: text1,
                                    style: TextStyle(fontSize: 16),
                                    onChanged: (value) async {
                                      if (value.trim().isNotEmpty)
                                        await controller
                                            .nmbrPetitEditing(int.parse(value));
                                      setState(() {});
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      isDense: true,
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      hintText:
                                          "${controller.stockOeuf.petits}",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 55,
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(8),
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
                                    controller: text2,
                                    style: TextStyle(fontSize: 16),
                                    onChanged: (value) async {
                                      if (value.trim().isNotEmpty)
                                        await controller
                                            .nmbrMoyenEditing(int.parse(value));
                                      setState(() {});
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      isDense: true,
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      hintText:
                                          "${controller.stockOeuf.moyens}",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 55,
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(8),
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
                                    controller: text3,
                                    style: TextStyle(fontSize: 16),
                                    onChanged: (value) async {
                                      if (value.trim().isNotEmpty)
                                        await controller
                                            .nmbrGrandEditing(int.parse(value));
                                      setState(() {});
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      isDense: true,
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      hintText:
                                          "${controller.stockOeuf.grands}",
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
                  onPressed: text1.text.isNotEmpty &&
                          text2.text.isNotEmpty &&
                          text3.text.isNotEmpty
                      ? () async {
                          await controller.saveEditStockOeuf();
                          FocusScope.of(context).unfocus();
                          Get.back();
                        }
                      : null,
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
