import 'package:gestionferme/App/Models/approProduitModel.dart';
import 'package:gestionferme/App/Models/approProvendeModel.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

import 'proFicheController.dart';

class ApproController extends GetxController {
  late ProFicheController _ficheController;
  var listProvendes = <Provende>[].obs;
  var listProdTraite = <Produit>[].obs;
  var listApproProvendes = <ApproProvende>[].obs;
  var listApproProdTraite = <ApproProduit>[].obs;
  /*var provendeLabel = "".obs;
  var prodTraiteLabel = "".obs;*/
  var nameProvendeError = false.obs;
  var nameProduitError = false.obs;
  var qteProvendeError = false.obs;
  var qteProduitError = false.obs;
  var nameProvende = "".obs;
  var nameProduit = "".obs;
  var unitPv = "".obs;
  var uniPd = "".obs;
  var initStkPv = 0.0.obs;
  var initStkPd = 0.0.obs;
  var valuePv = 0.0.obs;
  var valuePd = 0.0.obs;
  late Provende provende;
  late Produit produit;
  double xQte = 0;
  var date = "Date".obs;
  var _date = "".obs;

  @override
  void onReady() {
    //getListProduit();
    super.onReady();
  }

  Future<void> getDate(String dat) async {
    date.value = "${DateTime.parse(dat).day}"
        " -${DateTime.parse(dat).month}"
        " -${DateTime.parse(dat).year}";
    _date.value = dat;
    print("date = $date");
  }

  Future<List<Provende>> getListProvende() async {
    _ficheController = Get.find();
    await _ficheController.checkData();
    await DataBaseProvider.instance
        .getProvendes()
        .then((value) => listProvendes.value = value.reversed.toList());
    return listProvendes;
  }

  Future<List<Produit>> getListProduit() async {
    _ficheController = Get.find();
    await _ficheController.checkData();
    await DataBaseProvider.instance
        .getProduits()
        .then((value) => listProdTraite.value = value.reversed.toList());
    return listProdTraite;
  }

  Future<List<ApproProvende>> getListApproProvende() async {
    await DataBaseProvider.instance
        .getApproProvendes()
        .then((value) => listApproProvendes.value = value.reversed.toList());
    return listApproProvendes;
  }

  Future<List<ApproProduit>> getListApproProduit() async {
    await DataBaseProvider.instance
        .getApproProduits()
        .then((value) => listApproProdTraite.value = value.reversed.toList());
    return listApproProdTraite;
  }

  Future<void> nameProvendeEditing(String text) async {
    if (listProvendes.length == 0) {
      nameProvende.value = text;
    } else {
      for (int i = 0; i < listProvendes.length; i++) {
        String? data = listProvendes[i].nom;
        if (data.toLowerCase() == text.toLowerCase()) {
          nameProvendeError.value = true;
          return;
        }
      }
      nameProvendeError.value = false;
      nameProvende.value = text;
    }
    print(nameProvende);
  }

  Future<void> namePrduitEditing(String text) async {
    if (listProdTraite.length == 0) {
      nameProduit.value = text;
    } else {
      for (int i = 0; i < listProdTraite.length; i++) {
        String? data = listProdTraite[i].nom;
        if (data.toLowerCase() == text.toLowerCase()) {
          nameProduitError.value = true;
          return;
        }
        nameProduitError.value = false;
        nameProduit.value = text;
      }
    }
    print(nameProduit);
  }

  Future<void> initStockProduitEditing(double i) async {
    initStkPd.value = i;
  }

  Future<void> initStockProvendeEditing(double i) async {
    initStkPv.value = i;
  }

  Future<void> valueProduitEditing(double i) async {
    valuePd.value = i;
  }

  Future<void> valueProvendeEditing(double i) async {
    valuePv.value = i;
  }

  Future<void> renameProvende(Provende _provendex) async {
    String? lastName = _provendex.nom;
    _provendex.nom = nameProvende.value;
    await DataBaseProvider.instance.updateNameProvende(_provendex, lastName);
    await getListProvende();
    nameProvende.value = "";
  }

  Future<void> renameProduit(Produit _produitx) async {
    String? lastName = _produitx.nom;
    _produitx.nom = nameProduit.value;
    await DataBaseProvider.instance.updateNameProduit(_produitx, lastName);
    await getListProduit();
    nameProduit.value = "";
  }

  Future<void> addProvende() async {
    Provende provende = Provende(null, nameProvende.value, unitPv.value,
        initStkPv.value, valuePv.value, DateTime.now());
    await DataBaseProvider.instance.insertProvende(provende);
    await getListProvende();
    nameProvende.value = "";
    unitPv.value = "";
    initStkPv.value = 0;
    valuePv.value = 0;
  }

  Future<void> addProduit() async {
    Produit produit = Produit(null, nameProduit.value, uniPd.value,
        initStkPd.value, valuePd.value, DateTime.now());
    await DataBaseProvider.instance.insertProduit(produit);
    await getListProduit();
    nameProduit.value = "";
    uniPd.value = "";
    initStkPd.value = 0;
    valuePd.value = 0;
  }

  Future<void> qteProvendeEditing(double qte) async {
    xQte = qte;
    if (provende.qte + qte < 0) {
      qteProvendeError.value = true;
      return;
    } else {
      qteProvendeError.value = false;
      initStkPv.value = provende.qte + qte;
    }
  }

  Future<void> doApproProvende() async {
    ApproProvende approProvende = ApproProvende(null, provende, xQte > 0, xQte,
        valuePv.value, DateTime.parse(_date.value));
    await DataBaseProvider.instance.insertApproProvende(approProvende);
    provende.qte = initStkPv.value;
    provende.value = (provende.value! + valuePv.value);
    await DataBaseProvider.instance.updateProvende(provende);
    await getListApproProvende();
    date.value = "Date";
  }

  Future<void> doApproProduit() async {
    ApproProduit approProduit = ApproProduit(null, produit, xQte > 0, xQte,
        valuePd.value, DateTime.parse(_date.value));
    await DataBaseProvider.instance.insertApproProduit(approProduit);
    produit.qte = initStkPd.value;
    produit.value = (produit.value + valuePd.value);
    await DataBaseProvider.instance.updateProduit(produit);
    await getListApproProduit();
    date.value = "Date";
  }

  Future<void> qteProduitEditing(double qte) async {
    xQte = qte;
    if (produit.qte + qte < 0) {
      qteProduitError.value = true;
      return;
    } else {
      qteProduitError.value = false;
      initStkPd.value = produit.qte + qte;
    }
  }

  Future<Provende> recuperateProvende(Provende _provende) async {
    return provende = _provende;
  }

  Future<Produit> recuperateProduit(Produit _produit) async {
    return produit = _produit;
  }
}
