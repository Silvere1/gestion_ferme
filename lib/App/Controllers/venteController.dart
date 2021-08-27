import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/stockOeufsModel.dart';
import 'package:gestionferme/App/Models/venteOeufsModel.dart';
import 'package:gestionferme/App/Models/venteVolaillesModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

class VenteController extends GetxController {
  late CollecteOeufsController _collecteOeufsController;
  late AddLotController _addLotController;

  var nombreP = 0.obs;
  var nombreM = 0.obs;
  var nombreG = 0.obs;
  var oeufMontant = 0.0.obs;
  var erro1 = false.obs;
  var erro2 = false.obs;
  var erro3 = false.obs;
  var invalide1 = false.obs;
  var invalide2 = false.obs;
  var invalide3 = false.obs;
  var invalide4 = false.obs;
  var isValidate = false.obs;
  var erroQte = <bool>[].obs;
  var erroMontant = <bool>[].obs;

  var itemVolaillesVente = <Lot>[].obs;
  var plus = false.obs;
  var listVenteOeufs = <VenteOeuf>[].obs;
  var listVenteVolailles = <VenteVolailles>[].obs;
  late StockOeuf stockOeuf;
  var listLot = <Lot>[].obs;
  var newListVenteVolailles = <VenteVolailles>[].obs;
  late Lot _lot;
  late VenteVolailles _venteVolailles;

  @override
  void onInit() {
    super.onInit();
    _resetOj();
  }

  Future<void> _resetOj() async {
    _lot = Lot(null, 0, 0, 0, DateTime.now(), DateTime.now(), 1, 0, false, 3,
        DateTime.now());
    _venteVolailles = VenteVolailles(null, _lot, 0, 0, DateTime.now());
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

  Future<void> qteEditing(int qte, Lot lot) async {
    for (int i = 0; i < newListVenteVolailles.length; i++) {
      if (lot.num == newListVenteVolailles[i].lot.num) {
        if (qte > 0 && qte <= lot.nmbrVolauillles) {
          erroQte[i] = false;
          newListVenteVolailles[i].qte = qte;
          return;
        } else {
          erroQte[i] = true;
          return;
        }
      }
    }
  }

  Future<void> montantEditing(double montant, Lot lot) async {
    for (int i = 0; i < newListVenteVolailles.length; i++) {
      if (lot.num == newListVenteVolailles[i].lot.num) {
        if (montant > 0) {
          erroMontant[i] = false;
          newListVenteVolailles[i].montant = montant;
          return;
        } else {
          erroMontant[i] = true;
          return;
        }
      }
    }
  }

  Future<void> _remakeListToSave() async {
    for (int i = 0; i < newListVenteVolailles.length; i++) {
      newListVenteVolailles[i].dateTime = DateTime.now();
    }
  }

  Future<void> _updateLots() async {
    for (int i = 0; i < newListVenteVolailles.length; i++) {
      newListVenteVolailles[i].lot.nmbrVolauillles -=
          newListVenteVolailles[i].qte;
      await DataBaseProvider.instance.updateLot(newListVenteVolailles[i].lot);
    }
  }

  Future<void> _archiving() async {
    for (int i = 0; i < newListVenteVolailles.length; i++) {
      if (newListVenteVolailles[i].lot.nmbrVolauillles == 0) {
        newListVenteVolailles[i].lot.archive = 1;
        newListVenteVolailles[i].lot.archiveAt = DateTime.now();
        await DataBaseProvider.instance.updateLot(newListVenteVolailles[i].lot);
      }
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

  Future<void> montantOeufEditing(double val) async {
    if (val <= 0) {
      invalide4.value = true;
      oeufMontant.value = val;
    } else {
      invalide4.value = false;
      oeufMontant.value = val;
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

  Future<void> saveVenteVolailles() async {
    await _remakeListToSave();
    for (int i = 0; i < newListVenteVolailles.length; i++) {
      await DataBaseProvider.instance
          .insertVenteVolailles(newListVenteVolailles[i]);
    }
    await _updateLots();
    await _archiving();
    erroQte.value = [];
    erroMontant.value = [];
    itemVolaillesVente.value = [];
    newListVenteVolailles.value = [];
    await getListVenteVolailles();
  }

  Future<void> saveVenteOeuf() async {
    _collecteOeufsController = Get.find();
    _addLotController = Get.find();
    VenteOeuf venteOeuf = VenteOeuf(null, nombreP.value, nombreM.value,
        nombreG.value, oeufMontant.value, DateTime.now());
    await DataBaseProvider.instance.insertVenteOeuf(venteOeuf);
    await _updateStockOeuf();
    await getStockOeuf();
    await getListVenteOeufs();
    await _addLotController.getStockOeuf();
    await _collecteOeufsController.getStockOeuf();
    nombreP.value = 0;
    nombreM.value = 0;
    nombreG.value = 0;
    oeufMontant.value = 0;
  }

  Future<List<VenteVolailles>> getListVenteVolailles() async {
    await getListLot();
    return await DataBaseProvider.instance
        .getVenteVolailles()
        .then((value) => listVenteVolailles.value = value.reversed.toList());
  }

  Future<List<VenteOeuf>> getListVenteOeufs() async {
    await getStockOeuf();
    return await DataBaseProvider.instance
        .getVenteOeufs()
        .then((value) => listVenteOeufs.value = value.reversed.toList());
  }

  Future<void> getItem(Lot lot) async {
    _venteVolailles.lot = lot;
    if (!itemVolaillesVente.any((e) => e.num == lot.num)) {
      itemVolaillesVente.add(lot);
      newListVenteVolailles.add(_venteVolailles);
      erroQte.add(false);
      erroMontant.add(false);
    }
    _resetOj();
  }

  Future<void> getMoreItem(Lot lot) async {
    itemVolaillesVente.add(lot);
    update();
  }

  Future<void> deleteItem(
      Lot lot, VenteVolailles venteVolailles, int index) async {
    itemVolaillesVente.remove(lot);
    newListVenteVolailles.remove(venteVolailles);
    erroQte.removeAt(index);
    erroMontant.removeAt(index);
  }
}
