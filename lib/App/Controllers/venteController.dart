import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/venteOeufsModel.dart';
import 'package:gestionferme/App/Models/venteVolaillesModel.dart';
import 'package:get/get.dart';

class VenteController extends GetxController {
  var itemVolaillesVente = [].obs;
  var plus = false.obs;
  var listVenteOeufs = <VenteOeuf>[].obs;
  var listVenteVolailles = <VenteVolailles>[].obs;

  @override
  void onReady() {
    super.onReady();
    readListVenteOeufs();
    readListVenteVolailles();
  }

  Future<List<VenteVolailles>> readListVenteVolailles() async {
    listVenteVolailles.value = mesventevolaille.reversed.toList();
    return listVenteVolailles;
  }

  Future<List<VenteOeuf>> readListVenteOeufs() async {
    listVenteOeufs.value = mesventesoeufs.reversed.toList();
    return listVenteOeufs;
  }

  Future<void> getItem(Lot lot) async {
    itemVolaillesVente.value = [];
    itemVolaillesVente.add(lot);
  }

  Future<void> getMoreItem(Lot lot) async {
    itemVolaillesVente.add(lot);
    update();
  }

  Future<void> deleteItem(Lot i) async {
    itemVolaillesVente.remove(i);
  }
}
