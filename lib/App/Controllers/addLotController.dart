import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/stockOeufsModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

import '/App/date.dart';

class AddLotController extends GetxController {
  late CollecteOeufsController _collecteOeufsController;
  var date1 = "Date".obs;
  var date2 = "Date".obs;
  var _date1 = "Date".obs;
  var _date2 = "Date".obs;
  var nombre = 0.obs;
  var nombreP = 0.obs;
  var nombreM = 0.obs;
  var nombreG = 0.obs;
  var erro1 = false.obs;
  var erro2 = false.obs;
  var erro3 = false.obs;
  var invalide1 = false.obs;
  var invalide2 = false.obs;
  var invalide3 = false.obs;
  var isValidate = false.obs;
  var age = 0.obs;
  var montant = 0.obs;
  var listlot = <Lot>[].obs;
  var lotsExist = <Lot>[].obs;
  var archiveListLot = <Lot>[].obs;
  late StockOeuf stockOeuf;
  var oeufP = 0.obs;
  var oeufM = 0.obs;
  var oeufG = 0.obs;
  var oeufT = 0.obs;
  var allVoByAge1 = 0.obs;
  var allVoByAge2 = 0.obs;
  var allVoByAge3 = 0.obs;
  var totalVolailles = 0.obs;
  var lotsAge1 = 0.obs;
  var lotsAge2 = 0.obs;
  var lotsAge3 = 0.obs;

  @override
  void onReady() {
    //getListLots();
    //getStockOeuf();
    super.onReady();
  }

  Future<void> resetWdgets() async {
    date1.value = "Date";
    date2.value = "Date";
    erro1.value = false;
    erro2.value = false;
    erro3.value = false;
    invalide1.value = false;
    invalide2.value = false;
    invalide3.value = false;
    isValidate.value = false;
  }

  Future<StockOeuf> getStockOeuf() async {
    stockOeuf = await DataBaseProvider.instance.getStockOeuf();
    oeufP.value = stockOeuf.petits;
    oeufM.value = stockOeuf.moyens;
    oeufG.value = stockOeuf.grands;
    oeufT.value = stockOeuf.total;
    return stockOeuf;
  }

  Future<int> getData() async {
    await getListLots();
    return await getStockOeuf().then((value) => value.petits);
  }

  Future<List<Lot>> getListLots() async {
    await DataBaseProvider.instance.getLots().then((value) =>
        listlot.value = value.reversed.where((e) => e.archive == 3).toList());
    await filterLotAdg();
    await getAechiveLotsList();
    await checkLot();
    return listlot;
  }

  Future<List<Lot>> checkLot() async {
    return lotsExist.value = await DataBaseProvider.instance.getLots();
  }

  Future<List<Lot>> getAechiveLotsList() async {
    archiveListLot.value = [];
    await DataBaseProvider.instance.getLots().then((value) => archiveListLot
            .value =
        value.reversed.where((e) => e.archive == 1 || e.archive == 2).toList());
    return archiveListLot;
  }

  Future<void> filterLotAdg() async {
    allVoByAge1.value = 0;
    allVoByAge2.value = 0;
    allVoByAge3.value = 0;
    totalVolailles.value = 0;
    lotsAge1.value = 0;
    lotsAge2.value = 0;
    lotsAge3.value = 0;
    for (int i = 0; i < listlot.length; i++) {
      totalVolailles.value += listlot[i].nmbrVolauillles;
      if ((listlot[i].age +
              DateTime.now().difference(listlot[i].createAt).inDays) <=
          (12 * 7)) {
        ///To do
        allVoByAge1.value += listlot[i].nmbrVolauillles;
        lotsAge1.value += 1;
      } else if ((listlot[i].age +
              DateTime.now().difference(listlot[i].createAt).inDays) >=
          (24 * 7)) {
        ///To do
        allVoByAge3.value += listlot[i].nmbrVolauillles;
        lotsAge3.value += 1;
      } else {
        /// To do
        allVoByAge2.value += listlot[i].nmbrVolauillles;
        lotsAge2.value += 1;
      }
    }
  }

  Future<void> getDate1(String dat) async {
    date1.value = "${DateTime.parse(dat).day}"
        " -${DateTime.parse(dat).month}"
        " -${DateTime.parse(dat).year}";
    _date1.value = dat;
    print("date = $date1");
  }

  Future<void> getDate2(String dat) async {
    date2.value = "${DateTime.parse(dat).day}"
        " -${DateTime.parse(dat).month}"
        " -${DateTime.parse(dat).year}";
    _date2.value = dat;
    print("date = $date2");
  }

  /* Future<void> deleteAlot() async {
    DataBaseProvider.instance.detleteLot(2);
    await getListLots();
  }*/

  Future<void> nmbrEditing(int nmbr) async {
    nombre.value = nmbr;
    print("nombre = $nombre");
  }

  Future<void> validateMe() async {
    if (nombreP.value >= 0 &&
        nombreP.value <= stockOeuf.petits &&
        nombreM.value >= 0 &&
        nombreM.value <= stockOeuf.moyens &&
        nombreG.value >= 0 &&
        nombreG.value <= stockOeuf.grands) {
      isValidate.value = true;
    } else {
      isValidate.value = false;
    }
  }

  Future<void> _updateStockOeuf() async {
    stockOeuf.petits -= nombreP.value;
    stockOeuf.moyens -= nombreM.value;
    stockOeuf.grands -= nombreG.value;
    stockOeuf.total -= (nombreP.value + nombreM.value + nombreG.value);
    await DataBaseProvider.instance.updateStockOeuf(stockOeuf);
  }

  Future<void> nmbrPetitsEditing(int nmbr) async {
    if (nmbr < 0) {
      invalide1.value = true;
      erro1.value = true;
    } else {
      invalide1.value = false;
      if (nmbr > stockOeuf.petits) {
        nombreP.value = nmbr;
        erro1.value = true;
      } else {
        nombreP.value = nmbr;
        erro1.value = false;
      }
    }

    print("nombre = $nombreP");
  }

  Future<void> nmbrMoyensEditing(int nmbr) async {
    if (nmbr < 0) {
      invalide2.value = true;
      erro2.value = true;
    } else {
      invalide2.value = false;
      if (nmbr > stockOeuf.moyens) {
        nombreM.value = nmbr;
        erro2.value = true;
      } else {
        nombreM.value = nmbr;
        erro2.value = false;
      }
    }
    print("nombre = $nombreM");
  }

  Future<void> nmbrGrandsEditing(int nmbr) async {
    if (nmbr < 0) {
      invalide3.value = true;
      erro3.value = true;
    } else {
      invalide3.value = false;
      if (nmbr > stockOeuf.grands) {
        nombreG.value = nmbr;
        erro3.value = true;
      } else {
        nombreG.value = nmbr;
        erro3.value = false;
      }
    }
    print("nombre = $nombreG");
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
    _collecteOeufsController = Get.find();
    Lot lot = Lot(
        null,
        nombreP.value + nombreM.value + nombreG.value,
        nombreP.value + nombreM.value + nombreG.value,
        DateTime.now().difOnlyDay(DateTime.parse(_date1.value)),
        DateTime.now(),
        DateTime.parse(_date1.value),
        0,
        0,
        false,
        3,
        DateTime.now());
    await DataBaseProvider.instance.insertLot(lot);
    await _updateStockOeuf();
    await getStockOeuf();
    await _collecteOeufsController.getStockOeuf();
    await getListLots();
    date1.value = "Date";
    nombre.value = 0;
    nombreP.value = 0;
    nombreM.value = 0;
    nombreG.value = 0;
    age.value = 0;
    montant.value = 0;
    print("OK oK");
  }

  Future<void> addLotTypeTwo() async {
    /* lots.add(Lot((lots.length + 1), nombre.value, age.value, date.value, 1,
        montant.value, false));*/

    Lot lot = Lot(
        null,
        nombre.value,
        nombre.value,
        age.value,
        DateTime.now(),
        DateTime.parse(_date2.value),
        1,
        montant.value,
        false,
        3,
        DateTime.now());
    await DataBaseProvider.instance.insertLot(lot);
    await getListLots();
    date2.value = "Date";
    nombre.value = 0;
    age.value = 0;
    montant.value = 0;

    print("OK oK");
  }
}
