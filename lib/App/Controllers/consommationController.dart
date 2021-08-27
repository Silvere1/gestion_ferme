import 'package:gestionferme/App/Models/consomEauModel.dart';
import 'package:gestionferme/App/Models/consomProdTraiteModel.dart';
import 'package:gestionferme/App/Models/consomProvendeModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

import 'addLotController.dart';

class ConsommationController extends GetxController {
  late AddLotController _addLotController;
  var listConsProvende = <ConsomProvende>[].obs;
  var listConsEau = <ConsomEau>[].obs;
  var listConsProduit = <ConsomProdTraite>[].obs;
  var date = "Date".obs;
  var _date = "".obs;
  late Lot _lot;
  late ConsomEau _consomEau;
  late Produit _produit;
  late Provende _provende;
  late ConsomProdTraite _consomProdTraite;
  late ConsomProvende _consomProvende;
  var newListConsomEau = <ConsomEau>[].obs;
  var newListConsomProduit = <ConsomProdTraite>[].obs;
  var newListConsomProvende = <ConsomProvende>[].obs;
  var isValideConsEau = true.obs;
  var isValideConsProd = true.obs;
  var isValideConsProv = true.obs;
  double _sommeQte = 0;
  int _serviceOrder = 0;

  @override
  void onInit() {
    super.onInit();
    _produit = Produit(null, "", "", 0, 0, DateTime.now());
    _provende = Provende(null, "", "", 0, 0, DateTime.now());
    _resetObjConsEau();
    _resetObjConsProduit();
    _resetObjConsProvende();
  }

  _resetObjConsEau() {
    _lot = Lot(null, 0, 0, 0, DateTime.now(), DateTime.now(), 1, 0, false, 3,
        DateTime.now());
    _consomEau = ConsomEau(null, 0, _lot, DateTime.now());
  }

  Future<Produit> recuperateProduit(Produit _produitx) async {
    _consomProdTraite =
        ConsomProdTraite(null, _lot, _produitx, 0, DateTime.now());
    return _produit = _produitx;
  }

  Future<Provende> recuperateProvende(Provende _provendex) async {
    _consomProvende =
        ConsomProvende(null, _lot, _provendex, 0, 0, DateTime.now());
    return _provende = _provendex;
  }

  Future<int> getServiceOrder(int i) async {
    return _serviceOrder = i;
  }

  _resetObjConsProduit() {
    _lot = Lot(null, 0, 0, 0, DateTime.now(), DateTime.now(), 1, 0, false, 3,
        DateTime.now());
    _consomProdTraite =
        ConsomProdTraite(null, _lot, _produit, 0, DateTime.now());
  }

  _resetObjConsProvende() {
    _lot = Lot(null, 0, 0, 0, DateTime.now(), DateTime.now(), 1, 0, false, 3,
        DateTime.now());
    _consomProvende =
        ConsomProvende(null, _lot, _provende, 0, 0, DateTime.now());
  }

  Future<void> validateConsEau() async {
    newListConsomEau.every((e) => e.qte > 0
        ? isValideConsEau.value = true
        : isValideConsEau.value = false);
  }

  Future<void> validateConsProd() async {
    _sommeQte = 0;
    if (newListConsomProduit.every((e) => e.qte > 0)) {
      for (int i = 0; i < newListConsomProduit.length; i++) {
        _sommeQte += newListConsomProduit[i].qte;
      }
      if (_sommeQte <= _produit.qte) {
        isValideConsProd.value = true;
      } else {
        isValideConsProd.value = false;
      }
    } else {
      isValideConsProd.value = false;
    }
  }

  Future<void> validateConsProv() async {
    _sommeQte = 0;
    if (newListConsomProvende.every((e) => e.qte > 0)) {
      for (int i = 0; i < newListConsomProvende.length; i++) {
        _sommeQte += newListConsomProvende[i].qte;
      }
      if (_sommeQte <= _provende.qte) {
        isValideConsProv.value = true;
      } else {
        isValideConsProv.value = false;
      }
    } else {
      isValideConsProv.value = false;
    }
  }

  Future<void> _remakeListConsProdToSave() async {
    for (int i = 0; i < newListConsomProduit.length; i++) {
      newListConsomProduit[i].dateTime = DateTime.parse(_date.value);
    }
  }

  Future<void> _remakeListConsprovToSave() async {
    for (int i = 0; i < newListConsomProvende.length; i++) {
      newListConsomProvende[i].dateTime = DateTime.parse(_date.value);
      newListConsomProvende[i].orderService = _serviceOrder;
    }
  }

  Future<void> _remakeListConsEauToSave() async {
    for (int i = 0; i < newListConsomEau.length; i++) {
      newListConsomEau[i].dateTime = DateTime.parse(_date.value);
    }
  }

  Future<void> saveConsProvende() async {
    _provende.qte -= _sommeQte;
    await _remakeListConsprovToSave();
    for (int i = 0; i < newListConsomProvende.length; i++) {
      await DataBaseProvider.instance
          .insertConsomProvende(newListConsomProvende[i]);
    }
    await DataBaseProvider.instance.updateProvende(_provende);
    await getListConsProvende();
    date.value = "Date";
    newListConsomProvende.value = [];
    _sommeQte = 0;
  }

  Future<void> saveConsProduit() async {
    _produit.qte -= _sommeQte;
    await _remakeListConsProdToSave();
    for (int i = 0; i < newListConsomProduit.length; i++) {
      await DataBaseProvider.instance
          .insertConsomProduit(newListConsomProduit[i]);
    }
    await DataBaseProvider.instance.updateProduit(_produit);
    await getListConsProduit();
    date.value = "Date";
    newListConsomProduit.value = [];
    _sommeQte = 0;
  }

  Future<void> saveConsEau() async {
    await _remakeListConsEauToSave();
    for (int i = 0; i < newListConsomEau.length; i++) {
      await DataBaseProvider.instance.insertConsomEau(newListConsomEau[i]);
    }
    await getListConsEau();
    date.value = "Date";
    newListConsomEau.value = [];
  }

  Future<void> getItemConsEau(Lot lot) async {
    _consomEau.lot = lot;
    newListConsomEau.add(_consomEau);
    _resetObjConsEau();
  }

  Future<void> getAllItemConsEau(List<Lot> list) async {
    newListConsomEau.value = [];
    for (int i = 0; i < list.length; i++) {
      _consomEau.lot = list[i];
      newListConsomEau.add(_consomEau);
      _resetObjConsEau();
    }
  }

  Future<void> getItemConsProd(Lot lot) async {
    _consomProdTraite.lot = lot;
    newListConsomProduit.add(_consomProdTraite);
    _resetObjConsProduit();
  }

  Future<void> getAllItemConsProd(List<Lot> list) async {
    newListConsomProduit.value = [];
    for (int i = 0; i < list.length; i++) {
      _consomProdTraite.lot = list[i];
      newListConsomProduit.add(_consomProdTraite);
      _resetObjConsProduit();
    }
  }

  Future<void> getItemConsProv(Lot lot) async {
    _consomProvende.lot = lot;
    newListConsomProvende.add(_consomProvende);
    _resetObjConsProvende();
  }

  Future<void> getAllItemConsProv(List<Lot> list) async {
    newListConsomProvende.value = [];
    for (int i = 0; i < list.length; i++) {
      _consomProvende.lot = list[i];
      newListConsomProvende.add(_consomProvende);
      _resetObjConsProvende();
    }
  }

  Future<void> provendeQteEditing(double qte, Lot lot) async {
    for (int i = 0; i < newListConsomProvende.length; i++) {
      if (lot.num == newListConsomProvende[i].lot.num) {
        newListConsomProvende[i].qte = qte;
        print("Dans l'editer ${newListConsomProvende[i].qte}");
        return;
      }
    }
  }

  Future<void> produitQteEditing(double qte, Lot lot) async {
    for (int i = 0; i < newListConsomProduit.length; i++) {
      if (lot.num == newListConsomProduit[i].lot.num) {
        newListConsomProduit[i].qte = qte;
        print("Dans l'editer ${newListConsomProduit[i].qte}");
        return;
      }
    }
  }

  Future<void> eauQteEditing(double qte, Lot lot) async {
    for (int i = 0; i < newListConsomEau.length; i++) {
      if (lot.num == newListConsomEau[i].lot.num) {
        newListConsomEau[i].qte = qte;
        print("Dans l'editer ${newListConsomEau[i].qte}");
        return;
      }
    }
  }

  Future<void> deletAllItem() async {
    newListConsomEau.value = [];
    newListConsomProduit.value = [];
    newListConsomProvende.value = [];
  }

  Future<void> deleteItemConsEau(Lot lot) async {
    for (int i = 0; i < newListConsomEau.length; i++) {
      if (lot.num == newListConsomEau[i].lot.num) {
        newListConsomEau.remove(newListConsomEau[i]);
        return;
      }
    }
  }

  Future<void> deleteItemConsProd(Lot lot) async {
    for (int i = 0; i < newListConsomProduit.length; i++) {
      if (lot.num == newListConsomProduit[i].lot.num) {
        newListConsomProduit.remove(newListConsomProduit[i]);
        return;
      }
    }
  }

  Future<void> deleteItemConsProv(Lot lot) async {
    for (int i = 0; i < newListConsomProvende.length; i++) {
      if (lot.num == newListConsomProvende[i].lot.num) {
        newListConsomProvende.remove(newListConsomProvende[i]);
        return;
      }
    }
  }

  Future<void> checkList() async {
    for (int i = 0; i < newListConsomEau.length; i++) {
      print(newListConsomEau[i].lot.num);
      print("qte = ${newListConsomEau[i].qte}");
    }
  }

  Future<void> getDate(String dat) async {
    date.value = "${DateTime.parse(dat).day}"
        " -${DateTime.parse(dat).month}"
        " -${DateTime.parse(dat).year}";
    _date.value = dat;
    print("date = $date");
  }

  Future<List<ConsomProvende>> getListConsProvende() async {
    _addLotController = Get.find();
    await _addLotController.getListLots();
    await DataBaseProvider.instance
        .getConsProvende()
        .then((value) => listConsProvende.value = value.reversed.toList());
    return listConsProvende;
  }

  Future<List<ConsomProdTraite>> getListConsProduit() async {
    _addLotController = Get.find();
    await _addLotController.getListLots();
    await DataBaseProvider.instance
        .getConsProduit()
        .then((value) => listConsProduit.value = value.reversed.toList());
    return listConsProduit;
  }

  Future<List<ConsomEau>> getListConsEau() async {
    _addLotController = Get.find();
    await _addLotController.getListLots();
    await DataBaseProvider.instance
        .getConsEau()
        .then((value) => listConsEau.value = value.reversed.toList());
    return listConsEau;
  }
}
