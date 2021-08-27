import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Models/collecteModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/stockOeufsModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

class CollecteOeufsController extends GetxController {
  late AddLotController _addLotController;
  var date = "Date".obs;
  var _date = "".obs;
  var itemLotCollect = <Lot>[].obs;
  var newListCollect = <CollecteOeuf>[].obs;
  var listCollecteOuf = <CollecteOeuf>[].obs;
  var isValide = true.obs;
  var lotsExist = <Lot>[].obs;

  late CollecteOeuf _collecteOeuf;
  late Lot xlot;
  late StockOeuf _stockOeuf;
  late StockOeuf stockOeuf;

  @override
  void onReady() {
    super.onReady();
    //valiator();
    //readList();
  }

  @override
  void onInit() {
    _resetObj();
    //getStockOeuf();
    super.onInit();
  }

  Future<StockOeuf> getStockOeuf() async {
    return stockOeuf = await DataBaseProvider.instance.getStockOeuf();
  }

  _resetObj() {
    xlot = Lot(null, 0, 0, 0, DateTime.now(), DateTime.now(), 1, 0, false, 3,
        DateTime.now());
    _collecteOeuf = CollecteOeuf(null, xlot, 0, 0, 0, 0, DateTime.now());
  }

  Future<void> validateMe() async {
    print(newListCollect.length);

    newListCollect.every((e) => (e.petits + e.moyens + e.grands + e.feles) > 0)
        ? isValide.value = true
        : isValide.value = false;

    for (int i = 0; i < newListCollect.length; i++) {
      print(newListCollect[i].petits +
          newListCollect[i].moyens +
          newListCollect[i].grands +
          newListCollect[i].feles);
    }
  }

  Future<StockOeuf> _getStockOeuf() async {
    return await DataBaseProvider.instance.getStockOeuf();
  }

  Future<void> remakeListToSave() async {
    await _getStockOeuf().then((value) => _stockOeuf = value);
    for (int i = 0; i < newListCollect.length; i++) {
      newListCollect[i].dateTime = DateTime.parse(_date.value);
      _stockOeuf.petits += newListCollect[i].petits;
      _stockOeuf.moyens += newListCollect[i].moyens;
      _stockOeuf.grands += newListCollect[i].grands;
    }
    _stockOeuf.total =
        (_stockOeuf.petits + _stockOeuf.moyens + _stockOeuf.grands);
  }

  Future<void> saveCollecteOeuf() async {
    _addLotController = Get.find();
    for (int i = 0; i < newListCollect.length; i++) {
      await DataBaseProvider.instance.insertCollecteOeuf(newListCollect[i]);
    }
    await DataBaseProvider.instance.updateStockOeuf(_stockOeuf);
    await getListCollecte();
    await getStockOeuf();
    await _addLotController.getStockOeuf();
  }

  Future<List<CollecteOeuf>> getListCollecte() async {
    await checkLot();
    await DataBaseProvider.instance
        .getCollecteOeuf()
        .then((value) => listCollecteOuf.value = value.reversed.toList());
    return listCollecteOuf;
  }

  Future<List<Lot>> checkLot() async {
    return lotsExist.value = await DataBaseProvider.instance.getLots();
  }

  Future<void> getDate(String dat) async {
    date.value = "${DateTime.parse(dat).day}"
        " -${DateTime.parse(dat).month}"
        " -${DateTime.parse(dat).year}";
    _date.value = dat;
    print("date = $date");
  }

  Future<void> getItem(Lot lot) async {
    _collecteOeuf.lot = lot;
    print(itemLotCollect.length);
    print(newListCollect.length);
    if (!itemLotCollect.any((e) => e.num == lot.num)) {
      itemLotCollect.add(lot);
      newListCollect.add(_collecteOeuf);
    }
    _resetObj();
  }

  Future<void> checkList() async {
    for (int i = 0; i < itemLotCollect.length; i++) {
      print(itemLotCollect[i].num);
    }
    print("\n\n Ok \n\n Ok ");
    for (int i = 0; i < newListCollect.length; i++) {
      print(newListCollect[i].lot.num);
      print(newListCollect[i].petits);
      print(newListCollect[i].moyens);
      print(newListCollect[i].grands);
      print(newListCollect[i].feles);
      print(newListCollect[i].dateTime);
    }
    print("\n\n Ok \n\n Ok ");
  }

  Future<void> nbrPetEditing(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        newListCollect[i].petits = nbr;
        print("Dans l'editer ${newListCollect[i].petits}");
        return;
      }
    }
  }

  Future<void> nbrMoyEditing(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        newListCollect[i].moyens = nbr;
        print("Dans l'editer ${newListCollect[i].moyens}");
        return;
      }
    }
  }

  Future<void> nbrGraEditing(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        newListCollect[i].grands = nbr;
        print("Dans l'editer ${newListCollect[i].grands}");
        return;
      }
    }
  }

  Future<void> nbrFelEditing(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        newListCollect[i].feles = nbr;
        print("Dans l'editer ${newListCollect[i].feles}");
        return;
      }
    }
  }

  /* Future<void> getAllItem(List<Lot> list) async {
    itemLotCollect.value = [];
    for (int i = 0; i < list.length; i++) {
      itemLotCollect.add(list[i]);
    }
  }*/

  Future<void> deleteItem(Lot lot, CollecteOeuf collecteOeuf) async {
    itemLotCollect.remove(lot);
    newListCollect.remove(collecteOeuf);
    print(newListCollect.length);
  }
}
