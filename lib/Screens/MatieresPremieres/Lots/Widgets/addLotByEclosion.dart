import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:get/get.dart';

class AddLotByEclosion extends StatefulWidget {
  AddLotByEclosion({Key? key}) : super(key: key);

  @override
  _AddLotByEclosionState createState() => _AddLotByEclosionState();
}

class _AddLotByEclosionState extends State<AddLotByEclosion> {
  AddLotController controller = Get.put(AddLotController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16, left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  height: 80,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text("Nombre de poussins"),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          onChanged: (value) {
                            controller.nmbrEditing(int.parse(value));
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
                  height: 80,
                  margin: EdgeInsets.only(top: 2),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text("Date d'éclosion"),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 45,
                          child: Obx(() => ElevatedButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now(),
                                    initialDate: DateTime.now(),
                                  ).then((DateTime? value) => {
                                        controller.getDate(
                                            value!.day.toString() +
                                                "/" +
                                                value.month.toString() +
                                                "/" +
                                                value.year.toString()),
                                      });
                                },
                                child: Text(controller.date.value),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 45,
            width: Get.width - 28,
            margin: EdgeInsets.only(bottom: 28),
            child: Obx(() => ElevatedButton(
                  onPressed: controller.nombre.value != 0 &&
                          controller.date.value != "Date"
                      ? () async {
                          controller.addLotTypeOne();
                          Get.back();
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
