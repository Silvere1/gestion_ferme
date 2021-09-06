import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/stockOeufsModel.dart';
import 'package:gestionferme/App/Models/usageOeufsModel.dart';
import 'package:gestionferme/App/Models/usageVolaillesModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

import 'addLotController.dart';
import 'collecteOeufsController.dart';

class UsageController extends GetxController {
  late CollecteOeufsController _collecteOeufsController;
  late AddLotController _addLotController;
  var nombreP = 0.obs;
  var nombreM = 0.obs;
  var nombreG = 0.obs;
  var motif = "".obs;
  var erro1 = false.obs;
  var erro2 = false.obs;
  var erro3 = false.obs;
  var invalide1 = false.obs;
  var invalide2 = false.obs;
  var invalide3 = false.obs;
  var isValidate = false.obs;
  var itemUsage = <Lot>[].obs;
  var listUsedOeufs = <UsedOeufs>[].obs;
  var listUsedVolailles = <UsedVolailles>[].obs;
  var listLot = <Lot>[].obs;
  var vMotif = "".obs;
  var qteError = false.obs;
  var qteVolaille = 0.obs;
  late StockOeuf stockOeuf;
  var date = "Date".obs;
  var _date = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getDate(String dat) async {
    date.value = "${DateTime.parse(dat).day}"
        " -${DateTime.parse(dat).month}"
        " -${DateTime.parse(dat).year}";
    _date.value = dat;
    print("date = $date");
  }

  Future<List<Lot>> getListLot() async {
    _addLotController = Get.find();
    return await _addLotController
        .getListLots()
        .then((value) => listLot.value = value);
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

  Future<void> motifEditing(String text) async {
    if (text.trim().length <= 1) {
      motif.value = "";
    } else {
      motif.value = text;
    }
  }

  Future<void> motifVolaillesEditing(String text) async {
    if (text.trim().length <= 1) {
      vMotif.value = "";
    } else {
      vMotif.value = text;
    }
  }

  Future<void> qteEditing(int qte) async {
    if (qte > 0 && qte <= itemUsage[0].nmbrVolauillles) {
      qteVolaille.value = qte;
      qteError.value = false;
    } else {
      qteVolaille.value = 0;
      qteError.value = true;
    }
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

  Future<void> _updateLot() async {
    Lot lot = itemUsage[0];
    lot.nmbrVolauillles -= qteVolaille.value;
    if (lot.nmbrVolauillles == 0) {
      lot.archive = 1;
      lot.archiveAt = DateTime.now();
      await DataBaseProvider.instance.updateLot(lot);
    } else {
      await DataBaseProvider.instance.updateLot(lot);
    }
  }

  Future<StockOeuf> getStockOeuf() async {
    return stockOeuf = await DataBaseProvider.instance.getStockOeuf();
  }

  Future<void> _updateStockOeuf() async {
    stockOeuf.petits -= nombreP.value;
    stockOeuf.moyens -= nombreM.value;
    stockOeuf.grands -= nombreG.value;
    stockOeuf.total -= (nombreP.value + nombreM.value + nombreG.value);
    await DataBaseProvider.instance.updateStockOeuf(stockOeuf);
  }

  Future<void> saveUsedVolaille() async {
    _addLotController = Get.find();
    UsedVolailles usedVolailles = UsedVolailles(null, itemUsage[0],
        qteVolaille.value, vMotif.value, DateTime.parse(_date.value));
    await DataBaseProvider.instance.insertUsedVolailles(usedVolailles);
    await _updateLot();
    await getListUsedVolailles();
    qteVolaille.value = 0;
    vMotif.value = "";
    itemUsage.clear();
    date.value = "Date";
  }

  Future<void> saveUsedOeuf() async {
    _collecteOeufsController = Get.find();
    _addLotController = Get.find();
    UsedOeufs usedOeufs = UsedOeufs(null, nombreP.value, nombreM.value,
        nombreG.value, motif.value, DateTime.parse(_date.value));
    await DataBaseProvider.instance.insertUsedOeuf(usedOeufs);
    await _updateStockOeuf();
    await getListUsedOeuf();
    await getStockOeuf();
    await _addLotController.getStockOeuf();
    await _collecteOeufsController.getStockOeuf();
    nombreP.value = 0;
    nombreM.value = 0;
    nombreG.value = 0;
    motif.value = "";
    date.value = "Date";
  }

  Future<List<UsedOeufs>> getListUsedOeuf() async {
    await getStockOeuf();
    return await DataBaseProvider.instance
        .getUsedOeuf()
        .then((value) => listUsedOeufs.value = value.reversed.toList());
  }

  Future<List<UsedVolailles>> getListUsedVolailles() async {
    await getListLot();
    return await DataBaseProvider.instance
        .getUsedVolailles()
        .then((value) => listUsedVolailles.value = value.reversed.toList());
  }

  Future<void> getItem(Lot lot) async {
    itemUsage.value = [];
    itemUsage.add(lot);
  }
}
