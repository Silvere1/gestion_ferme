import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:get/get.dart';

class AddLotController extends GetxController {
  var date = "Date".obs;
  var nombre = 0.obs;
  var age = 0.obs;
  var montant = 0.obs;
  var listlot = [].obs;

  @override
  void onReady() {
    getListLots();
    date.value = "Date";
    super.onReady();
  }

  Future<void> getListLots() async {
    listlot.value = [];
    listlot.value = lots.reversed.toList();
  }

  Future<void> getDate(String dat) async {
    date.value = dat;
    print("date = $date");
  }

  Future<void> nmbrEditing(int nmbr) async {
    nombre.value = nmbr;
    print("nombre = $nombre");
  }

  Future<void> ageEditing(int ag) async {
    age.value = ag;
    print("Âge = $age");
  }

  Future<void> montantEditing(int montan) async {
    montant.value = montan;
    print("Montant = $montant");
  }

  Future<void> addLotTypeOne() async {
    lots.add(Lot((lots.length + 1), nombre.value, 0, date.value, 0, 0, false));
    getListLots();
    date.value = "Date";
    nombre.value = 0;
    age.value = 0;
    montant.value = 0;
    print("OK oK");
  }

  Future<void> addLotTypeTwo() async {
    lots.add(Lot((lots.length + 1), nombre.value, age.value, date.value, 1,
        montant.value, false));
    getListLots();
    date.value = "Date";
    nombre.value = 0;
    age.value = 0;
    montant.value = 0;

    print("OK oK");
  }
}
