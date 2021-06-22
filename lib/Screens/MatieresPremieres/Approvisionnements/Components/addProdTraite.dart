import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:get/get.dart';

class AddProdTraite extends StatefulWidget {
  const AddProdTraite(this.pageController);
  final PageController pageController;

  @override
  _AddProdTraiteState createState() => _AddProdTraiteState(pageController);
}

class _AddProdTraiteState extends State<AddProdTraite> {
  final PageController pageController;
  ApproController controller = Get.find();

  _AddProdTraiteState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 18, top: 10, left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${controller.prodTraiteLabel}"),
                      IconButton(
                        splashColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOutBack);
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text("Quantité"),
                              ),
                            ),
                            Expanded(
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
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 45,
            width: Get.width - 28,
            margin: EdgeInsets.only(bottom: 28),
            child: ElevatedButton(
              onPressed: () async {
                pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutBack);
              },
              child: Text("Enregistrer"),
            ),
          ),
        ],
      ),
    );
  }
}
