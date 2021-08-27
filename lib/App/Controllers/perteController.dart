import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/perteOeufsModel.dart';
import 'package:gestionferme/App/Models/perteVolaillesModel.dart';
import 'package:gestionferme/App/Models/stockOeufsModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

import 'addLotController.dart';
import 'collecteOeufsController.dart';

class PerteController extends GetxController {
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
  var itemPerte = <Lot>[].obs;
  var listPerteOeufs = <PerteOeufs>[].obs;
  var listPerteVolailles = <PerteVolailles>[].obs;
  var listLot = <Lot>[].obs;
  var vMotif = "".obs;
  var qteError = false.obs;
  var qteVolaille = 0.obs;
  late StockOeuf stockOeuf;

  @override
  void onReady() {
    super.onReady();
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
    if (text.trim().length <= 4) {
      motif.value = "";
    } else {
      motif.value = text;
    }
  }

  Future<void> motifVolaillesEditing(String text) async {
    if (text.trim().length <= 4) {
      vMotif.value = "";
    } else {
      vMotif.value = text;
    }
  }

  Future<void> qteEditing(int qte) async {
    if (qte > 0 && qte <= itemPerte[0].nmbrVolauillles) {
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

  Future<void> _updateLot() async {
    Lot lot = itemPerte[0];
    lot.nmbrVolauillles -= qteVolaille.value;
    if (lot.nmbrVolauillles == 0) {
      lot.archive = 1;
      lot.archiveAt = DateTime.now();
      await DataBaseProvider.instance.updateLot(lot);
    } else {
      await DataBaseProvider.instance.updateLot(lot);
    }
  }

  Future<void> savePerteVolaille() async {
    _addLotController = Get.find();
    PerteVolailles perteVolailles = PerteVolailles(
        null, itemPerte[0], qteVolaille.value, vMotif.value, DateTime.now());
    await DataBaseProvider.instance.insertPerteVolailles(perteVolailles);
    await _updateLot();
    await getListPerteVolailles();
    qteVolaille.value = 0;
    vMotif.value = "";
    itemPerte.value = [];
  }

  Future<void> savePerteOeuf() async {
    _collecteOeufsController = Get.find();
    _addLotController = Get.find();
    PerteOeufs perteOeufs = PerteOeufs(null, nombreP.value, nombreM.value,
        nombreG.value, motif.value, DateTime.now());
    await DataBaseProvider.instance.insertPerteOeuf(perteOeufs);
    await _updateStockOeuf();
    await getStockOeuf();
    await getListPerteOeufs();
    await _addLotController.getStockOeuf();
    await _collecteOeufsController.getStockOeuf();
    nombreP.value = 0;
    nombreM.value = 0;
    nombreG.value = 0;
    motif.value = "";
  }

  Future<List<PerteOeufs>> getListPerteOeufs() async {
    await getStockOeuf();
    return await DataBaseProvider.instance
        .getPerteOeuf()
        .then((value) => listPerteOeufs.value = value.reversed.toList());
  }

  Future<List<PerteVolailles>> getListPerteVolailles() async {
    await getListLot();
    return await DataBaseProvider.instance
        .getPerteVolailles()
        .then((value) => listPerteVolailles.value = value.reversed.toList());
  }

  Future<void> getItem(Lot lot) async {
    itemPerte.value = [];
    itemPerte.add(lot);
  }
}
