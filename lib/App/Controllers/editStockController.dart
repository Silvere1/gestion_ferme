import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Controllers/collecteOeufsController.dart';
import 'package:gestionferme/App/Models/editStockOeufModel.dart';
import 'package:gestionferme/App/Models/editStockProduit.dart';
import 'package:gestionferme/App/Models/editStockProvende.dart';
import 'package:gestionferme/App/Models/editStockVolailleModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';
import 'package:gestionferme/App/Models/stockOeufsModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

class EditStockController extends GetxController {
  late CollecteOeufsController _collecteOeufsController;
  late AddLotController _addLotController;
  late StockOeuf stockOeuf;
  late StockOeuf _stockOeuf;
  var nmbPetit = 0.obs;
  var nmbMoyen = 0.obs;
  var nmbGrand = 0.obs;
  var nmbrVolail = 0.obs;
  var qteProv = 0.0.obs;
  var qteProd = 0.0.obs;
  var valNmbrV = "".obs;
  var valQteProv = "".obs;
  var valQteProd = "".obs;
  var listEditStkOeuf = <EditStockOeuf>[].obs;
  var listEditStkVolailles = <EditStockVolailles>[].obs;
  var listEditStockProvende = <EditStockProvende>[].obs;
  var listEditStockProduit = <EditStockProduit>[].obs;
  var itemLot = <Lot>[].obs;
  var itemProvende = <Provende>[].obs;
  var itemProduit = <Produit>[].obs;

  Future<void> nmbrPetitEditing(int nmbr) async {
    nmbPetit.value = nmbr;
  }

  Future<void> nmbrMoyenEditing(int nmbr) async {
    nmbMoyen.value = nmbr;
  }

  Future<void> nmbrGrandEditing(int nmbr) async {
    nmbGrand.value = nmbr;
  }

  Future<void> nmbrVolaillesEditing(int nmbr) async {
    valNmbrV.value = "$nmbr";
    nmbrVolail.value = nmbr;
  }

  Future<void> qteProvendeEditing(double val) async {
    qteProv.value = val;
    valQteProv.value = "$val";
  }

  Future<void> qteProduitEditing(double val) async {
    qteProd.value = val;
    valQteProd.value = "$val";
  }

  Future<void> saveEditStockprovende() async {
    Provende xprovende = itemProvende[0];
    xprovende.qte = qteProv.value;
    EditStockProvende editStockProvende =
        EditStockProvende(null, itemProvende[0], qteProv.value, DateTime.now());
    await DataBaseProvider.instance.insertEditStockProvende(editStockProvende);
    await DataBaseProvider.instance.updateProvende(xprovende);
    await getListEditStockProvende();
    itemProvende.value = [];
    valQteProv.value = "";
  }

  Future<void> saveEditStockProduit() async {
    Produit xproduit = itemProduit[0];
    xproduit.qte = qteProd.value;
    EditStockProduit editStockProduit =
        EditStockProduit(null, itemProduit[0], qteProd.value, DateTime.now());
    await DataBaseProvider.instance.insertEditStockProduit(editStockProduit);
    await DataBaseProvider.instance.updateProduit(xproduit);
    await getListEditStockProduit();
    itemProduit.clear();
    valQteProd.value = "";
  }

  Future<void> saveEditStockVolaille() async {
    _addLotController = Get.find();
    Lot xlot = itemLot[0];
    EditStockVolailles editStockVolailles =
        EditStockVolailles(null, itemLot[0], nmbrVolail.value, DateTime.now());
    await DataBaseProvider.instance
        .insertEditStockVolailles(editStockVolailles);
    if (nmbrVolail.value == 0) {
      xlot.archive = 1;
      xlot.nmbrVolauillles = nmbrVolail.value;
      await DataBaseProvider.instance.updateLot(xlot);
    }
    xlot.nmbrVolauillles = nmbrVolail.value;
    await DataBaseProvider.instance.updateLot(xlot);
    await getListEditStkVolaille();
    await _addLotController.getListLots();
    itemLot.value = [];
    valNmbrV.value = "";
  }

  Future<void> saveEditStockOeuf() async {
    _stockOeuf = StockOeuf(stockOeuf.key, nmbPetit.value, nmbMoyen.value,
        nmbGrand.value, nmbPetit.value + nmbMoyen.value + nmbGrand.value);
    EditStockOeuf editStockOeuf = EditStockOeuf(null, stockOeuf, nmbPetit.value,
        nmbMoyen.value, nmbGrand.value, DateTime.now());
    await DataBaseProvider.instance.insertEditStockOeuf(editStockOeuf);
    await DataBaseProvider.instance.updateStockOeuf(_stockOeuf);
    await getListEditStkOeuf();
  }

  Future<List<EditStockOeuf>> getListEditStkOeuf() async {
    _collecteOeufsController = Get.find();
    await _collecteOeufsController
        .getStockOeuf()
        .then((value) => stockOeuf = value);
    return await DataBaseProvider.instance
        .getEditStockOeuf()
        .then((value) => listEditStkOeuf.value = value.reversed.toList());
  }

  Future<List<EditStockVolailles>> getListEditStkVolaille() async {
    return await DataBaseProvider.instance
        .getEditStockVolailles()
        .then((value) => listEditStkVolailles.value = value.reversed.toList());
  }

  Future<List<EditStockProvende>> getListEditStockProvende() async {
    return await DataBaseProvider.instance
        .getEditStockProvende()
        .then((value) => listEditStockProvende.value = value.reversed.toList());
  }

  Future<List<EditStockProduit>> getListEditStockProduit() async {
    return await DataBaseProvider.instance
        .getEditStockProduit()
        .then((value) => listEditStockProduit.value = value.reversed.toList());
  }

  Future<void> getItem(Lot lot) async {
    itemLot.value = [];
    itemLot.add(lot);
  }

  Future<void> getItemProvende(Provende provende) async {
    itemProvende.value = [];
    itemProvende.add(provende);
  }

  Future<void> getItemProduit(Produit produit) async {
    itemProduit.value = [];
    itemProduit.add(produit);
  }
}
