import 'package:gestionferme/App/Models/approProduitModel.dart';
import 'package:gestionferme/App/Models/approProvendeModel.dart';
import 'package:gestionferme/App/Models/consomProdTraiteModel.dart';
import 'package:gestionferme/App/Models/consomProvendeModel.dart';
import 'package:gestionferme/App/Models/editStockProduit.dart';
import 'package:gestionferme/App/Models/editStockProvende.dart';
import 'package:gestionferme/App/Models/ficheModel.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/App/date.dart';

class ProFicheController extends GetxController {
  var _listAppProv = <ApproProvende>[];
  var _listAppProd = <ApproProduit>[];
  var _listConsProv = <ConsomProvende>[];
  var _listConsProd = <ConsomProdTraite>[];
  var _listEdProv = <EditStockProvende>[];
  var _listEdProd = <EditStockProduit>[];
  var listProv = <Provende>[];
  var listProd = <Produit>[];
  late DateTime startDate;
  late DateTime endDate;
  late DateTime repDate;
  var debutDate = "Date de début".obs;
  var finDate = "Date de fin".obs;
  late var dateFormat;
  var _listInfoPro = <InfoPro>[].obs;
  var listInfoPro = <InfoPro>[].obs;
  var listInfoProd = <Prod>[].obs;
  var listInfoProv = <Prov>[].obs;
  late InfoPro _infoPro;
  var isLoading = false.obs;

  Future<bool> setLoading(bool val) async {
    return isLoading.value = val;
  }

  Future<void> initDateFormat() async {
    dateFormat = DateFormat.yMMMMd('fr');
  }

  Future<DateTime> recuperateStartDate(DateTime date) async {
    await initDateFormat();
    debutDate.value = dateFormat.format(date);
    return startDate = date;
  }

  Future<DateTime> recuperateEndDate(DateTime date) async {
    await initDateFormat();
    finDate.value = dateFormat.format(date);
    return endDate = date;
  }

  Future<void> checkData() async {
    debutDate.value = "Date de début";
    finDate.value = "Date de fin";
    await _getProv();
    await _getProd();
    DateTime? _prodDate;
    DateTime? _provDate;
    if (listProd.length > 0) {
      _prodDate = listProd.first.createAt;
    }
    if (listProv.length > 0) {
      _provDate = listProv.first.createAt;
    }
    if (_prodDate != null && _provDate == null) {
      repDate = _prodDate;
    }
    if (_prodDate == null && _provDate != null) {
      repDate = _provDate;
    }
    if (_prodDate != null && _provDate != null) {
      if (_provDate.isBefore(_prodDate)) {
        repDate = _provDate;
      } else {
        repDate = _prodDate;
      }
    }
  }

  Future<List<Produit>> _getProd() async {
    listProd.clear();
    return listProd = await DataBaseProvider.instance.getProduits();
  }

  Future<List<Provende>> _getProv() async {
    listProv.clear();
    return listProv = await DataBaseProvider.instance.getProvendes();
  }

  Future<List<ApproProvende>> _getAppProv() async {
    _listAppProv.clear();
    return _listAppProv = await DataBaseProvider.instance.getApproProvendes();
  }

  Future<List<ApproProduit>> _getAppProd() async {
    _listAppProd.clear();
    return _listAppProd = await DataBaseProvider.instance.getApproProduits();
  }

  Future<List<ConsomProvende>> _getConsProv() async {
    _listConsProv.clear();
    return _listConsProv = await DataBaseProvider.instance.getConsProvende();
  }

  Future<List<ConsomProdTraite>> _getConsProd() async {
    _listConsProd.clear();
    return _listConsProd = await DataBaseProvider.instance.getConsProduit();
  }

  Future<List<EditStockProvende>> _getEditProv() async {
    _listEdProv.clear();
    return _listEdProv = await DataBaseProvider.instance.getEditStockProvende();
  }

  Future<List<EditStockProduit>> _getEditProd() async {
    _listEdProd.clear();
    return _listEdProd = await DataBaseProvider.instance.getEditStockProduit();
  }

  /*Future<List<InfoPro>> collectInfo() async {
    listInfoPro.clear();
    await _getProd();
    await _getProv();
    await _getAppProd();
    await _getAppProv();
    await _getConsProv();
    await _getConsProd();
    await _getEditProd();
    await _getEditProv();
    for (int i = 0; i <= endDate.difOnlyDay(startDate); i++) {
      _infoPro = InfoPro(DateTime.now(), [], []);
      _infoPro.dateAt = startDate.add(Duration(days: i)).myDateTime();

      if (listInfoPro.length == 0) {
        listProd.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt)) {
            _infoPro.prod.add(Prod(e.num, e.nom, 0, 0, 0, 0));
          }
          return true;
        });

        listProv.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt))
            _infoPro.prov.add(Prov(e.num, e.nom, 0, 0, 0, 0));
          return true;
        });

        _listAppProd.every((e) {
          if (e.createAt.isBefore(_infoPro.dateAt)) {
            _infoPro.prod.every((x) {
              if (x.num == e.produit.num) {
                x.iniQte = e.produit.qte + e.qte;
              }
              return true;
            });
          }
          return true;
        });
        _listAppProv.every((e) {
          if (e.createAt.isBefore(_infoPro.dateAt)) {
            _infoPro.prov.every((x) {
              if (x.num == e.provende.num) {
                x.iniQte = e.provende.qte + e.qte;
              }
              return true;
            });
          }
          return true;
        });
      } else {
        listInfoPro[i - 1].prod.every((e) {
          _infoPro.prod.add(e);
          return true;
        });
        listInfoPro[i - 1].prov.every((e) {
          _infoPro.prov.add(e);
          return true;
        });
        listProd.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt)) {
            _infoPro.prod.add(Prod(e.num, e.nom, 0, 0, 0, 0));
          }
          return true;
        });
        listProv.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt)) {
            _infoPro.prov.add(Prov(e.num, e.nom, 0, 0, 0, 0));
          }
          return true;
        });
        _listAppProd.every((e) {
          if (e.createAt.isBefore(_infoPro.dateAt)) {
            _infoPro.prod.every((x) {
              if (x.num == e.produit.num) {
                x.iniQte = e.produit.qte + e.qte;
              }
              return true;
            });
          }
          return true;
        });

        _listAppProv.every((e) {
          if (e.createAt.isBefore(_infoPro.dateAt)) {
            _infoPro.prov.every((x) {
              if (x.num == e.provende.num) {
                x.iniQte = e.provende.qte + e.qte;
              }
              return true;
            });
          }
          return true;
        });
      }

      _listAppProd.every((e) {
        if (e.createAt.isSameDate(_infoPro.dateAt)) {
          _infoPro.prod.every((x) {
            if (x.num == e.produit.num) {
              x.approQte += e.qte;
            }
            return true;
          });
        }
        return true;
      });

      _listAppProv.every((e) {
        print(e.qte);
        print(e.createAt);
        print(_infoPro.dateAt);
        if (e.createAt.isSameDate(_infoPro.dateAt)) {
          _infoPro.prov.every((x) {
            if (x.num == e.provende.num) {
              x.approQte += e.qte;
            }
            return true;
          });
        }
        return true;
      });

      _listConsProv.every((e) {
        if (e.dateTime.isSameDate(_infoPro.dateAt)) {
          _infoPro.prov.every((x) {
            if (x.num == e.provende.num) {
              x.consQte += e.qte;
            }
            return true;
          });
        }
        return true;
      });

      _listConsProd.every((e) {
        if (e.dateTime.isSameDate(_infoPro.dateAt)) {
          _infoPro.prod.every((x) {
            if (x.num == e.produit.num) {
              x.consQte += e.qte;
            }
            return true;
          });
        }
        return true;
      });

      _infoPro.prod.every((e) {
        e.finQte = (e.iniQte + e.approQte) - e.consQte;
        return true;
      });
      _infoPro.prov.every((e) {
        e.finQte = (e.iniQte + e.approQte) - e.consQte;
        return true;
      });

      listInfoPro.add(_infoPro);
    }

    print(listInfoPro.length);
    print(listInfoPro[12].prov[2].approQte);
    return listInfoPro;
  }*/
  Future<List<InfoPro>> collectInfo() async {
    _listInfoPro.clear();
    listInfoPro.clear();
    listInfoProd.clear();
    listInfoProv.clear();
    await _getProd();
    await _getProv();
    await _getAppProd();
    await _getAppProv();
    await _getConsProv();
    await _getConsProd();
    await _getEditProd();
    await _getEditProv();
    for (int i = 0; i <= DateTime.now().difOnlyDay(repDate); i++) {
      _infoPro = InfoPro(DateTime.now(), [], []);
      _infoPro.dateAt = repDate.add(Duration(days: i)).myDateTime();

      if (_listInfoPro.length == 0) {
        listProd.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt)) {
            _infoPro.prod.add(Prod(e.num, e.nom, e.unite, 0, 0, 0, 0));
          }
          return true;
        });

        listProv.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt))
            _infoPro.prov.add(Prov(e.num, e.nom, e.unite, 0, 0, 0, 0));
          return true;
        });

        _listAppProd.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt)) {
            _infoPro.prod.every((x) {
              if (x.num == e.produit.num) {
                x.approQte += e.qte;
              }
              return true;
            });
          }
          return true;
        });
        _listAppProv.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt)) {
            _infoPro.prov.every((x) {
              if (x.num == e.provende.num) {
                x.approQte += e.qte;
              }
              return true;
            });
          }
          return true;
        });
      } else {
        _listInfoPro[i - 1].prod.every((e) {
          _infoPro.prod.add(Prod(e.num, e.nom, e.unite, e.finQte, 0, 0, 0));
          return true;
        });
        _listInfoPro[i - 1].prov.every((e) {
          _infoPro.prov.add(Prov(e.num, e.nom, e.unite, e.finQte, 0, 0, 0));
          return true;
        });
        listProd.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt)) {
            _infoPro.prod.add(Prod(e.num, e.nom, e.unite, 0, 0, 0, 0));
          }
          return true;
        });
        listProv.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt)) {
            _infoPro.prov.add(Prov(e.num, e.nom, e.unite, 0, 0, 0, 0));
          }
          return true;
        });
        _listAppProd.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt)) {
            _infoPro.prod.every((x) {
              if (x.num == e.produit.num) {
                x.approQte += e.qte;
              }
              return true;
            });
          }
          return true;
        });

        _listAppProv.every((e) {
          if (e.createAt.isSameDate(_infoPro.dateAt)) {
            _infoPro.prov.every((x) {
              if (x.num == e.provende.num) {
                x.approQte += e.qte;
              }
              return true;
            });
          }
          return true;
        });
      }

      _listConsProv.every((e) {
        if (e.dateTime.isSameDate(_infoPro.dateAt)) {
          _infoPro.prov.every((x) {
            if (x.num == e.provende.num) {
              x.consQte += e.qte;
            }
            return true;
          });
        }
        return true;
      });

      _listConsProd.every((e) {
        if (e.dateTime.isSameDate(_infoPro.dateAt)) {
          _infoPro.prod.every((x) {
            if (x.num == e.produit.num) {
              x.consQte += e.qte;
            }
            return true;
          });
        }
        return true;
      });

      _listEdProd.every((e) {
        if (e.createAt.isSameDate(_infoPro.dateAt)) {
          _infoPro.prod.every((x) {
            if (x.num == e.produit.num) {
              if (x.iniQte == e.produit.qte) {
                x.iniQte = e.qte;
              }
            }
            return true;
          });
        }
        return true;
      });
      _listEdProv.every((e) {
        if (e.createAt.isSameDate(_infoPro.dateAt)) {
          _infoPro.prov.every((x) {
            if (x.num == e.provende.num) {
              if (x.iniQte == e.provende.qte) {
                x.iniQte = e.qte;
              }
            }
            return true;
          });
        }
        return true;
      });

      _infoPro.prod.every((e) {
        e.finQte = (e.iniQte + e.approQte) - e.consQte;
        return true;
      });
      _infoPro.prov.every((e) {
        e.finQte = (e.iniQte + e.approQte) - e.consQte;
        return true;
      });

      _listInfoPro.add(_infoPro);
    }

    for (int i = 0; i <= endDate.difOnlyDay(startDate); i++) {
      DateTime _date = startDate.add(Duration(days: i));
      _listInfoPro.every((e) {
        if (e.dateAt.isSameDate(_date)) {
          listInfoPro.add(e);
        }
        return true;
      });
    }

    listInfoPro.every((e) {
      if (listInfoProd.length == 0) {
        if (e.prod.length > 0) listInfoProd.add(e.prod.first);
      } else {
        e.prod.every((w) {
          listInfoProd.every((x) {
            if (x.num == w.num) {
              x.approQte += w.approQte;
              x.consQte += w.consQte;
              x.finQte = w.finQte;
            }
            return true;
          });
          if (listInfoProd.every((element) => element.num != w.num)) {
            listInfoProd.add(w);
          }
          return true;
        });
      }
      if (listInfoProv.length == 0) {
        if (e.prov.length > 0) listInfoProv.add(e.prov.first);
      } else {
        e.prov.every((w) {
          listInfoProv.every((x) {
            if (x.num == w.num) {
              x.approQte += w.approQte;
              x.consQte += w.consQte;
              x.finQte = w.finQte;
            }
            return true;
          });
          if (listInfoProv.every((element) => element.num != w.num)) {
            listInfoProv.add(w);
          }
          return true;
        });
      }
      return true;
    });

    print(_listInfoPro.length);
    /*print(_listInfoPro[14].prov[2].approQte);*/
    return listInfoPro;
  }
}
