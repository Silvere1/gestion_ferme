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
  var textController = TextEditingController();
  var textController1 = TextEditingController();

  _AddProdTraiteState(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 18, top: 10, left: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${controller.produit.nom}"),
                        IconButton(
                          splashColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            textController1.clear();
                            textController.clear();
                            setState(() {});
                            pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeOutBack);
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            margin: EdgeInsets.only(top: 16),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
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
                                  child: Obx(() => TextFormField(
                                        controller: textController,
                                        onChanged: (value) {
                                          if (value.trim().isNotEmpty)
                                            controller.qteProduitEditing(
                                                double.parse(value));
                                          setState(() {});
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          isCollapsed: true,
                                          contentPadding: EdgeInsets.all(10),
                                          filled: true,
                                          fillColor:
                                              controller.qteProduitError.value
                                                  ? Colors.red
                                                  : null,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                      )),
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
                                    controller: textController1,
                                    onChanged: (value) {
                                      if (value.trim().isNotEmpty)
                                        controller.valueProduitEditing(
                                            double.parse(value));
                                      setState(() {});
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.all(10),
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
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 45,
            width: Get.width - 28,
            margin: EdgeInsets.only(bottom: 28),
            child: Obx(() => ElevatedButton(
                  onPressed: !controller.qteProduitError.value &&
                          textController.text.trim().isNotEmpty &&
                          textController1.text.trim().isNotEmpty
                      ? () async {
                          await controller.doApproProduit();
                          textController1.clear();
                          textController.clear();
                          setState(() {});
                          await pageController.previousPage(
                              duration: Duration(microseconds: 1),
                              curve: Curves.easeOutBack);
                          await pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOutBack);
                        }
                      : null,
                  child: Text("Enregistrer"),
                )),
          ),
        ],
      ),
    );
  }
}
