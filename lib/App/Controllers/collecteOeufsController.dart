import 'package:gestionferme/App/Controllers/addLotController.dart';
import 'package:gestionferme/App/Models/collecteModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/stockOeufsModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

import '/App/date.dart';

class CollecteOeufsController extends GetxController {
  late AddLotController _addLotController;
  var date = "Date".obs;
  var _date = "".obs;
  var itemLotCollect = <Lot>[].obs;
  var newListCollect = <CollecteOeuf>[].obs;
  var listCollecteOuf = <CollecteOeuf>[].obs;
  var isValide = false.obs;
  var lotsExist = <Lot>[].obs;
  var listlot = <Lot>[].obs;
  var _listlot = <Lot>[].obs;
  var stored = <Stored>[].obs;

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

  Future<List<Lot>> getListLots() async {
    await DataBaseProvider.instance.getLots().then((value) =>
        _listlot.value = value.reversed.where((e) => e.archive == 3).toList());
    return _listlot;
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
    DateTime _dateAt = DateTime.parse(_date.value);

    stored.every((e) {
      e.deja = 0;
      return true;
    });

    listCollecteOuf.every((e) {
      if (e.dateTime.isSameDate(_dateAt)) {
        stored.every((x) {
          if (x.numLot == e.lot.num) {
            x.deja += (e.petits + e.moyens + e.grands + e.feles);
          }
          return true;
        });
        print("Okko${e.num}");
        print(e.petits + e.moyens + e.grands + e.feles);
        print("Okko");
      }
      return true;
    });

    stored.every((e) {
      newListCollect.every((x) {
        if (e.numLot == x.lot.num &&
            (e.deja + x.petits + x.moyens + x.grands + x.feles) <=
                x.lot.nmbrVolauillles &&
            (x.petits + x.moyens + x.grands + x.feles) > 0) {
          e.valide = true;
        } else if (e.numLot == x.lot.num &&
            ((e.deja + x.petits + x.moyens + x.grands + x.feles) >
                    x.lot.nmbrVolauillles ||
                (x.petits + x.moyens + x.grands + x.feles) == 0)) {
          e.valide = false;
        }
        return true;
      });
      return true;
    });

    stored.every((e) {
      print(e.valide);
      print(e.deja);
      return true;
    });

    stored.every((e) => e.valide == true)
        ? isValide.value = true
        : isValide.value = false;
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
    await remakeListToSave();
    for (int i = 0; i < newListCollect.length; i++) {
      await DataBaseProvider.instance.insertCollecteOeuf(newListCollect[i]);
    }
    await DataBaseProvider.instance.updateStockOeuf(_stockOeuf);
    await getListCollecte();
    await getStockOeuf();
    await _addLotController.getStockOeuf();
    itemLotCollect.clear();
    newListCollect.clear();
    date.value = "Date";
    await checkList();
  }

  Future<List<CollecteOeuf>> getListCollecte() async {
    listCollecteOuf.clear();
    await getListLots();
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
    listlot.clear();
    itemLotCollect.clear();
    newListCollect.clear();
    stored.clear();
    date.value = "${DateTime.parse(dat).day}"
        " -${DateTime.parse(dat).month}"
        " -${DateTime.parse(dat).year}";
    _date.value = dat;
    print("date = $date");

    DateTime _dateAt = DateTime.parse(dat).myDateTime();
    _listlot.every((e) {
      print(e.buyAt);
      if (e.buyAt.isSameDate(_dateAt) ||
          e.buyAt.myDateTime().isBefore(_dateAt)) {
        listlot.add(e);
      }
      return true;
    });
    var _listItem = <Lot>[];
    var _newList = <CollecteOeuf>[];
    itemLotCollect.every((e) {
      if (e.buyAt.isSameDate(_dateAt) ||
          e.buyAt.myDateTime().isBefore(_dateAt)) {
        _listItem.add(e);
      }
      return true;
    });
    itemLotCollect.value = _listItem;
    newListCollect.every((e) {
      if (e.lot.buyAt.isSameDate(_dateAt) ||
          e.lot.buyAt.myDateTime().isBefore(_dateAt)) {
        _newList.add(e);
      }
      return true;
    });
    newListCollect.value = _newList;
  }

  Future<void> getItem(Lot lot) async {
    _collecteOeuf.lot = lot;
    if (itemLotCollect.every((e) => e.num != lot.num)) {
      itemLotCollect.add(lot);
      newListCollect.add(_collecteOeuf);
      stored.add(Stored(lot.num!, 0, false));
    }
    _resetObj();
    await validateMe();
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
        int pl = newListCollect[i].petits ~/ 30;
        newListCollect[i].petits = (pl * 30) + nbr;
        print("Dans l'editer ${newListCollect[i].petits}");
        return;
      }
    }
  }

  Future<void> nbrPetEditingPlt(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        int oef = newListCollect[i].petits % 30;
        newListCollect[i].petits = (nbr * 30) + oef;
        print("Dans l'editer ${newListCollect[i].petits}");
        return;
      }
    }
  }

  Future<void> nbrMoyEditing(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        int pl = newListCollect[i].moyens ~/ 30;
        newListCollect[i].moyens = (pl * 30) + nbr;
        print("Dans l'editer ${newListCollect[i].moyens}");
        return;
      }
    }
  }

  Future<void> nbrMoyEditingPlt(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        int oef = newListCollect[i].moyens % 30;
        newListCollect[i].moyens = (nbr * 30) + oef;
        print("Dans l'editer ${newListCollect[i].moyens}");
        return;
      }
    }
  }

  Future<void> nbrGraEditing(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        int pl = newListCollect[i].grands ~/ 30;
        newListCollect[i].grands = (pl * 30) + nbr;
        print("Dans l'editer ${newListCollect[i].grands}");
        return;
      }
    }
  }

  Future<void> nbrGraEditingPlt(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        int oef = newListCollect[i].grands % 30;
        newListCollect[i].grands = (nbr * 30) + oef;
        print("Dans l'editer ${newListCollect[i].grands}");
        return;
      }
    }
  }

  Future<void> nbrFelEditing(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        int pl = newListCollect[i].feles ~/ 30;
        newListCollect[i].feles = (pl * 30) + nbr;
        print("Dans l'editer ${newListCollect[i].feles}");
        return;
      }
    }
  }

  Future<void> nbrFelEditingPlt(int nbr, Lot lot) async {
    for (int i = 0; i < newListCollect.length; i++) {
      if (lot.num == newListCollect[i].lot.num) {
        int oef = newListCollect[i].feles % 30;
        newListCollect[i].feles = (nbr * 30) + oef;
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
    stored.removeWhere((e) => e.numLot == lot.num);
    print(newListCollect.length);
  }
}

class Stored {
  int numLot;
  int deja;
  bool valide;
  Stored(this.numLot, this.deja, this.valide);
}
