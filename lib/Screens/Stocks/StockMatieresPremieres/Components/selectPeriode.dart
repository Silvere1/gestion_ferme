import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/proFicheController.dart';
import 'package:gestionferme/Screens/Stocks/StockMatieresPremieres/Components/voirFichePro.dart';
import 'package:get/get.dart';

class SelectePeriode extends StatefulWidget {
  const SelectePeriode();

  @override
  _SelectePeriodeState createState() => _SelectePeriodeState();
}

class _SelectePeriodeState extends State<SelectePeriode> {
  ProFicheController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 190,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Sélectionner une période",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() => TextFormField(
                  focusNode: FocusNode(),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: controller.repDate,
                      lastDate: DateTime.now(),
                      initialDate: controller.repDate,
                    ).then((DateTime? value) => {
                          if (value != null)
                            controller.recuperateStartDate(value),
                        });
                  },
                  decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    hintText: "${controller.debutDate}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Obx(() => TextFormField(
                  focusNode: FocusNode(),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: controller.repDate,
                      lastDate: DateTime.now(),
                      initialDate: DateTime.now(),
                    ).then((DateTime? value) => {
                          if (value != null)
                            controller.recuperateEndDate(value),
                        });
                  },
                  decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    hintText: "${controller.finDate}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 36,
              child: Obx(() => ElevatedButton(
                    onPressed: controller.finDate.value == "Date de fin" ||
                            controller.debutDate.value == "Date de début"
                        ? null
                        : () {
                            Get.back();
                            Get.to(() => VoirFichePro());
                          },
                    child: Text("Valider"),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
