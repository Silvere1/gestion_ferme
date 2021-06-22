import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/perteOeufsModel.dart';
import 'package:gestionferme/App/Models/perteVolaillesModel.dart';
import 'package:get/get.dart';

class PerteController extends GetxController {
  var itemPerte = [].obs;
  var listPerteOeufs = <PerteOeufs>[].obs;
  var listPerteVolailles = <PerteVolailles>[].obs;

  @override
  void onReady() {
    super.onReady();
    readListPerteOeufs();
    readListPerteVolailles();
  }

  Future<List<PerteOeufs>> readListPerteOeufs() async {
    listPerteOeufs.value = mespertesoeufs.reversed.toList();
    return listPerteOeufs;
  }

  Future<List<PerteVolailles>> readListPerteVolailles() async {
    listPerteVolailles.value = mespertevolailles.reversed.toList();
    return listPerteVolailles;
  }

  Future<void> getItem(Lot lot) async {
    itemPerte.value = [];
    itemPerte.add(lot);
  }
}
