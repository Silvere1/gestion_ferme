import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';
import 'package:get/get.dart';

class ApproController extends GetxController {
  var listProvendes = [].obs;
  var listProdTraite = [].obs;
  var provendeLabel = "".obs;
  var prodTraiteLabel = "".obs;

  @override
  void onReady() {
    getListProduit();
    super.onReady();
  }

  Future<void> moveInstence(int i) async {
    provendeLabel.value = listProvendes[i].nom;
    update();
  }

  Future<void> moveInstenceTwo(int i) async {
    prodTraiteLabel.value = listProdTraite[i].nom;
    update();
  }

  Future<void> getListProduit() async {
    listProvendes.value = [];
    listProdTraite.value = [];
    listProvendes.value = provendes.reversed.toList();
    listProdTraite.value = produits.reversed.toList();
  }
}
