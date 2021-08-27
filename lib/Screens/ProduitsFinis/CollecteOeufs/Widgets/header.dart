import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:gestionferme/Screens/ProduitsFinis/CollecteOeufs/Components/listLotsDialog.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CollecteOeufsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ListLotsDialog();
                      });
                },
                child: Text("Sélectionner de lots"),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 40,
              child: Obx(() => ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                      ).then((DateTime? value) => {
                            if (value != null)
                              controller.getDate(value.toIso8601String()),
                          });
                    },
                    child: Text(controller.date.value),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
