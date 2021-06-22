import 'package:gestionferme/App/Models/collecteModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:get/get.dart';

class CollecteOeufsController extends GetxController {
  var date = "Sélectionner la date".obs;
  var itemLotCollect = <Lot>[].obs;

  var listCollecteOuf = <CollecteOeuf>[].obs;

  @override
  void onReady() {
    super.onReady();
    readList();
  }

  Future<List<CollecteOeuf>> readList() async {
    listCollecteOuf.value = collectoeuf.reversed.toList();
    return listCollecteOuf;
  }

  Future<void> getDate(String dat) async {
    date.value = dat;
    print("date = $date");
  }

  Future<void> getItem(Lot lot) async {
    itemLotCollect.add(lot);
  }

  Future<void> getAllItem(List<Lot> list) async {
    itemLotCollect.value = [];
    for (int i = 0; i < list.length; i++) {
      itemLotCollect.add(list[i]);
    }
  }

  Future<void> deleteItem(Lot i) async {
    itemLotCollect.remove(i);
  }
}
