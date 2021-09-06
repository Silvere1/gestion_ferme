import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/approController.dart';
import 'package:get/get.dart';

class AddProvende extends StatefulWidget {
  const AddProvende(this.pageController);
  final PageController pageController;

  @override
  _AddProvendeState createState() => _AddProvendeState(pageController);
}

class _AddProvendeState extends State<AddProvende> {
  final PageController pageController;
  ApproController controller = Get.find();
  var textController = TextEditingController();
  var textController1 = TextEditingController();

  _AddProvendeState(this.pageController);
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
                    margin: EdgeInsets.only(right: 18, top: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              splashColor: Theme.of(context).primaryColor,
                              onPressed: () {
                                textController1.clear();
                                textController.clear();
                                controller.date.value = "Date";
                                setState(() {});
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeOutBack);
                              },
                              icon: Icon(Icons.close),
                            ),
                            Center(child: Text("${controller.provende.nom}")),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 38,
                            child: Obx(() => ElevatedButton(
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime.now(),
                                      initialDate: DateTime.now(),
                                    ).then((DateTime? value) => {
                                          if (value != null)
                                            controller.getDate(
                                                value.toIso8601String()),
                                        });
                                  },
                                  child: Text(controller.date.value),
                                )),
                          ),
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
                                            controller.qteProvendeEditing(
                                                double.parse(value));
                                          setState(() {});
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          isCollapsed: true,
                                          contentPadding: EdgeInsets.all(10),
                                          filled: true,
                                          fillColor:
                                              controller.qteProvendeError.value
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
                                        controller.valueProvendeEditing(
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
                  onPressed: !controller.qteProvendeError.value &&
                          textController.text.trim().isNotEmpty &&
                          textController1.text.trim().isNotEmpty &&
                          controller.date.value != "Date"
                      ? () async {
                          await controller.doApproProvende();
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
