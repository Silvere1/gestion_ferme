import 'package:gestionferme/App/Models/collecteModel.dart';
import 'package:gestionferme/App/Models/consomEauModel.dart';
import 'package:gestionferme/App/Models/consomProdTraiteModel.dart';
import 'package:gestionferme/App/Models/consomProvendeModel.dart';
import 'package:gestionferme/App/Models/editStockVolailleModel.dart';
import 'package:gestionferme/App/Models/ficheModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/perteVolaillesModel.dart';
import 'package:gestionferme/App/Models/usageVolaillesModel.dart';
import 'package:gestionferme/App/Models/venteVolaillesModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

import '/App/date.dart';

class FicheController extends GetxController {
  late Lot _lot;
  var _listPerte = <PerteVolailles>[];
  var _listUsedVol = <UsedVolailles>[];
  var _listVenteVol = <VenteVolailles>[];
  var _listConsProv = <ConsomProvende>[];
  var _listConsProd = <ConsomProdTraite>[];
  var _listConsEau = <ConsomEau>[];
  var _listCollect = <CollecteOeuf>[];
  var _listEditeStockVol = <EditStockVolailles>[];

  var listEditeStockVol = <EditStockVolailles>[];
  var bilanConsProv = <TotalProvende>[];
  var bilanTraite = <TotalProduit>[];
  int totalMort = 0;
  int totalManger = 0;
  int totalVendu = 0;
  int totalOeufs = 0;
  double totalEau = 0;

  var listInfoDayVol = <InfoDayVol>[];
  late InfoDayVol _infoDayVol;

  Future<List<PerteVolailles>> _getMort() async {
    _listPerte.clear();

    await DataBaseProvider.instance.getPerteVolailles().then((value) {
      _listPerte
          .addAll(value.map((e) => e).where((e) => e.lot.num == _lot.num));
    });
    return _listPerte;
  }

  Future<List<UsedVolailles>> _getConsVol() async {
    _listUsedVol.clear();

    await DataBaseProvider.instance.getUsedVolailles().then((value) {
      _listUsedVol
          .addAll(value.map((e) => e).where((e) => e.lot.num == _lot.num));
    });
    return _listUsedVol;
  }

  Future<List<VenteVolailles>> _getVenteVol() async {
    _listVenteVol.clear();

    await DataBaseProvider.instance.getVenteVolailles().then((value) {
      _listVenteVol
          .addAll(value.map((e) => e).where((e) => e.lot.num == _lot.num));
    });
    return _listVenteVol;
  }

  Future<List<ConsomProvende>> _getConsProv() async {
    _listConsProv.clear();
    await DataBaseProvider.instance.getConsProvende().then((value) {
      _listConsProv
          .addAll(value.map((e) => e).where((e) => e.lot.num == _lot.num));
    });
    return _listConsProv;
  }

  Future<List<ConsomProdTraite>> _getConsProd() async {
    _listConsProd.clear();
    await DataBaseProvider.instance.getConsProduit().then((value) {
      _listConsProd
          .addAll(value.map((e) => e).where((e) => e.lot.num == _lot.num));
    });
    return _listConsProd;
  }

  Future<List<ConsomEau>> _getConsEau() async {
    _listConsEau.clear();
    await DataBaseProvider.instance.getConsEau().then((value) async {
      _listConsEau
          .addAll(value.map((e) => e).where((e) => e.lot.num == _lot.num));
    });
    return _listConsEau;
  }

  Future<List<CollecteOeuf>> _getCollecte() async {
    _listCollect.clear();

    await DataBaseProvider.instance.getCollecteOeuf().then((value) {
      _listCollect
          .addAll(value.map((e) => e).where((e) => e.lot.num == _lot.num));
    });
    return _listCollect;
  }

  Future<List<EditStockVolailles>> _getEditVol() async {
    _listEditeStockVol.clear();
    listEditeStockVol.clear();

    await DataBaseProvider.instance.getEditStockVolailles().then((value) {
      _listEditeStockVol
          .addAll(value.map((e) => e).where((e) => e.lot.num == _lot.num));
    });
    listEditeStockVol = _listEditeStockVol;
    return _listEditeStockVol;
  }

  Future<Lot> recuparateLot(Lot xlot) async {
    _lot = xlot;
    return _lot;
  }

  Future<List<InfoDayVol>> collecteInfo() async {
    listInfoDayVol.clear();
    bilanConsProv.clear();
    bilanTraite.clear();
    totalMort = 0;
    totalManger = 0;
    totalVendu = 0;
    totalOeufs = 0;
    totalEau = 0;
    await _getCollecte();
    await _getConsEau();
    await _getConsProd();
    await _getConsProv();
    await _getConsVol();
    await _getMort();
    await _getVenteVol();
    await _getEditVol();
    print("OkOKok");
    for (int i = 0;
        i <=
            DateTime.now()
                .difOnlyDay(_lot.type == 0 ? _lot.buyAt : _lot.createAt);
        i++) {
      _infoDayVol = InfoDayVol(_lot, DateTime.now(), 0, 0, 0, 0, 0, 0, [], [],
          [], [], 0, 0, 0, 0, 0, 0, 0, [], []);
      _infoDayVol.dateAt = _lot.type == 0
          ? _lot.buyAt.add(Duration(days: i)).myDateTime()
          : _lot.createAt.add(Duration(days: i)).myDateTime();
      print("OkOK${_lot.createAt}");
      print(_infoDayVol.dateAt);

      if (listInfoDayVol.length == 0) {
        _infoDayVol.dayOfWeek = 1;
        _infoDayVol.effDepart = _lot.iniNbrVol;

        ///update nombre de volailles départ
        _listEditeStockVol.every((e) {
          if (e.dateTime.isSameDate(_infoDayVol.dateAt))
            _infoDayVol.effDepart = e.qte;
          return true;
        });
      } else {
        _infoDayVol.effDepart = listInfoDayVol[i - 1].effFinal;

        ///update nombre de volailles départ
        _listEditeStockVol.every((e) {
          print("nombre nouveau ${e.qte}");
          if (e.dateTime.isSameDate(_infoDayVol.dateAt))
            _infoDayVol.effDepart = e.qte;

          return true;
        });
        if (listInfoDayVol.length < 7) {
          _infoDayVol.dayOfWeek = i + 1;
        } else {
          if (listInfoDayVol[i - 1].dayOfWeek == 6) {
            _infoDayVol.dayOfWeek = 7;
          } else {
            _infoDayVol.dayOfWeek = (i + 1) % 7;
          }
        }
      }

      ///do perte vol item
      _listPerte.every((e) {
        if (e.dateTime.isSameDate(_infoDayVol.dateAt))
          _infoDayVol.nbrMort += e.qte;
        print("bouclé ${e.qte}");
        return true;
      });

      ///do conson volail
      _listUsedVol.every((e) {
        if (e.dateTime.isSameDate(_infoDayVol.dateAt))
          _infoDayVol.nbrCons += e.qte;
        return true;
      });

      ///do vente volail
      _listVenteVol.every((e) {
        if (e.dateTime.isSameDate(_infoDayVol.dateAt))
          _infoDayVol.nbrVendu += e.qte;
        return true;
      });

      ///make different type Provende
      _listConsProv.every((e) {
        if (e.dateTime.isSameDate(_infoDayVol.dateAt)) {
          if (_infoDayVol.service1.length == 0 && e.orderService == 1) {
            _infoDayVol.service1.add(e);
          } else if (e.orderService == 1) {
            _infoDayVol.service1.every((x) {
              if (x.provende.num == e.provende.num) x.qte += e.qte;
              return true;
            });
            if (_infoDayVol.service1
                .every((element) => element.provende.num != e.provende.num)) {
              _infoDayVol.service1.add(e);
            }
          }
          if (_infoDayVol.service2.length == 0 && e.orderService == 2) {
            _infoDayVol.service2.add(e);
          } else if (e.orderService == 2) {
            _infoDayVol.service2.every((x) {
              if (x.provende.num == e.provende.num) x.qte += e.qte;
              return true;
            });
            if (_infoDayVol.service2
                .every((element) => element.provende.num != e.provende.num)) {
              _infoDayVol.service2.add(e);
            }
          }
          if (_infoDayVol.service3.length == 0 && e.orderService == 3) {
            _infoDayVol.service3.add(e);
          } else if (e.orderService == 3) {
            _infoDayVol.service3.every((x) {
              if (x.provende.num == e.provende.num) x.qte += e.qte;
              return true;
            });
            if (_infoDayVol.service3
                .every((element) => element.provende.num != e.provende.num)) {
              _infoDayVol.service3.add(e);
            }
          }
        }
        return true;
      });

      /// traitement collecte
      _listConsProd.every((e) {
        if (e.dateTime.isSameDate(_infoDayVol.dateAt)) {
          if (_infoDayVol.traitement.length == 0) {
            _infoDayVol.traitement.add(e);
          } else {
            _infoDayVol.traitement.every((x) {
              if (x.produit.num == e.produit.num) x.qte += e.qte;
              return true;
            });
            if (_infoDayVol.traitement
                .every((element) => element.produit.num != e.produit.num)) {
              _infoDayVol.traitement.add(e);
            }
          }
        }
        return true;
      });

      ///total traitement
      _infoDayVol.traitement.every((e) {
        if (_infoDayVol.totalTraitement.length == 0) {
          _infoDayVol.totalTraitement.add(TotalProduit(
              e.produit.num, e.produit.nom, e.qte, e.produit.unite));
        } else {
          _infoDayVol.totalTraitement.every((x) {
            if (x.num == e.produit.num) x.total += e.qte;
            return true;
          });
          if (_infoDayVol.totalTraitement
              .every((element) => element.num != e.produit.num)) {
            _infoDayVol.totalTraitement.add(TotalProduit(
                e.produit.num, e.produit.nom, e.qte, e.produit.unite));
          }
        }
        if (bilanTraite.length == 0) {
          bilanTraite.add(TotalProduit(
              e.produit.num, e.produit.nom, e.qte, e.produit.unite));
        } else {
          bilanTraite.every((x) {
            if (x.num == e.produit.num) {
              x.total += e.qte;
            }
            return true;
          });
          if (bilanTraite.every((element) => element.num != e.produit.num)) {
            bilanTraite.add(TotalProduit(
                e.produit.num, e.produit.nom, e.qte, e.produit.unite));
          }
        }
        return true;
      });

      ///total services
      _infoDayVol.service1.every((e) {
        if (_infoDayVol.totalServices.length == 0) {
          _infoDayVol.totalServices.add(TotalProvende(
              e.provende.num, e.provende.nom, e.qte, e.provende.unite));
        } else {
          _infoDayVol.totalServices.every((x) {
            if (x.num == e.provende.num) {
              x.total += e.qte;
            }
            return true;
          });
          if (_infoDayVol.totalServices
              .every((element) => element.num != e.provende.num)) {
            _infoDayVol.totalServices.add(TotalProvende(
                e.provende.num, e.provende.nom, e.qte, e.provende.unite));
          }
        }
        if (bilanConsProv.length == 0) {
          bilanConsProv.add(TotalProvende(
              e.provende.num, e.provende.nom, e.qte, e.provende.unite));
        } else {
          bilanConsProv.every((x) {
            if (x.num == e.provende.num) {
              x.total += e.qte;
            }
            return true;
          });
          if (bilanConsProv.every((element) => element.num != e.provende.num)) {
            bilanConsProv.add(TotalProvende(
                e.provende.num, e.provende.nom, e.qte, e.provende.unite));
          }
        }
        return true;
      });
      _infoDayVol.service2.every((e) {
        if (_infoDayVol.totalServices.length == 0) {
          _infoDayVol.totalServices.add(TotalProvende(
              e.provende.num, e.provende.nom, e.qte, e.provende.unite));
        } else {
          _infoDayVol.totalServices.every((x) {
            if (x.num == e.provende.num) {
              x.total += e.qte;
            }
            return true;
          });
          if (_infoDayVol.totalServices
              .every((element) => element.num != e.provende.num)) {
            _infoDayVol.totalServices.add(TotalProvende(
                e.provende.num, e.provende.nom, e.qte, e.provende.unite));
          }
        }
        if (bilanConsProv.length == 0) {
          bilanConsProv.add(TotalProvende(
              e.provende.num, e.provende.nom, e.qte, e.provende.unite));
        } else {
          bilanConsProv.every((x) {
            if (x.num == e.provende.num) {
              x.total += e.qte;
            }
            return true;
          });
          if (bilanConsProv.every((element) => element.num != e.provende.num)) {
            bilanConsProv.add(TotalProvende(
                e.provende.num, e.provende.nom, e.qte, e.provende.unite));
          }
        }
        return true;
      });
      _infoDayVol.service3.every((e) {
        if (_infoDayVol.totalServices.length == 0) {
          _infoDayVol.totalServices.add(TotalProvende(
              e.provende.num, e.provende.nom, e.qte, e.provende.unite));
        } else {
          _infoDayVol.totalServices.every((x) {
            if (x.num == e.provende.num) {
              x.total += e.qte;
            }
            return true;
          });
          if (_infoDayVol.totalServices
              .every((element) => element.num != e.provende.num)) {
            _infoDayVol.totalServices.add(TotalProvende(
                e.provende.num, e.provende.nom, e.qte, e.provende.unite));
          }
        }
        if (bilanConsProv.length == 0) {
          bilanConsProv.add(TotalProvende(
              e.provende.num, e.provende.nom, e.qte, e.provende.unite));
        } else {
          bilanConsProv.every((x) {
            if (x.num == e.provende.num) {
              x.total += e.qte;
            }
            return true;
          });
          if (bilanConsProv.every((element) => element.num != e.provende.num)) {
            bilanConsProv.add(TotalProvende(
                e.provende.num, e.provende.nom, e.qte, e.provende.unite));
          }
        }
        return true;
      });

      /// consom Eau
      /// /*if (e.dateTime.difference(_infoDayVol.dateAt).inDays == 0)*/
      _listConsEau.every((e) {
        if (e.dateTime.isSameDate(_infoDayVol.dateAt))
          _infoDayVol.qteEau += e.qte;
        return true;
      });

      /// collecte oeufs
      _listCollect.every((e) {
        if (e.dateTime.isSameDate(_infoDayVol.dateAt)) {
          _infoDayVol.cP += e.petits;
          _infoDayVol.cM += e.moyens;
          _infoDayVol.cG += e.grands;
          _infoDayVol.cF += e.feles;
          _infoDayVol.cT += (e.petits + e.moyens + e.grands + e.feles);
        }
        return true;
      });

      ///do effectif final
      _infoDayVol.effFinal = _infoDayVol.effDepart -
          (_infoDayVol.nbrMort + _infoDayVol.nbrCons + _infoDayVol.nbrVendu);

      ///taux de ponte
      _infoDayVol.tauxPonte = (_infoDayVol.cT / _infoDayVol.effDepart) * 100;

      listInfoDayVol.add(_infoDayVol);
    }
    print("OkOK");
    print(listInfoDayVol.length);
    print(listInfoDayVol[0].dateAt);
    print(listInfoDayVol[0].dateAt.myDateTime());
    print(listInfoDayVol[0].cT);
    print(listInfoDayVol[0].tauxPonte);

    listInfoDayVol.every((e) {
      totalManger += e.nbrCons;
      totalVendu += e.nbrVendu;
      totalMort += e.nbrMort;
      totalOeufs += e.cT;
      totalEau += e.qteEau;
      return true;
    });

    return listInfoDayVol;
  }
}
