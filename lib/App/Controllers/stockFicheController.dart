import 'package:gestionferme/App/Models/collecteModel.dart';
import 'package:gestionferme/App/Models/editStockOeufModel.dart';
import 'package:gestionferme/App/Models/editStockVolailleModel.dart';
import 'package:gestionferme/App/Models/ficheModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/perteOeufsModel.dart';
import 'package:gestionferme/App/Models/perteVolaillesModel.dart';
import 'package:gestionferme/App/Models/usageOeufsModel.dart';
import 'package:gestionferme/App/Models/usageVolaillesModel.dart';
import 'package:gestionferme/App/Models/venteOeufsModel.dart';
import 'package:gestionferme/App/Models/venteVolaillesModel.dart';
import 'package:gestionferme/App/Provider/dataBaseProvider.dart';
import 'package:get/get.dart';

import '/App/date.dart';

class StockFicheController extends GetxController {
  var _stkListPerte = <PerteVolailles>[];
  var _stkListUsedVol = <UsedVolailles>[];
  var _stkListVenteVol = <VenteVolailles>[];
  var _stkListCollect = <CollecteOeuf>[];
  var _stkListEditVol = <EditStockVolailles>[];
  var _stkListEditOeuf = <EditStockOeuf>[];
  var _stkListVenteOeuf = <VenteOeuf>[];
  var _stkListUsedOeuf = <UsedOeufs>[];
  var _stkListPerteOeuf = <PerteOeufs>[];
  var _stkListAllLot = <Lot>[];
  var listInfoStock = <InfoStock>[];
  late InfoStock _infoStock;

  Future<List<PerteOeufs>> _getPerteOeuf() async {
    _stkListPerteOeuf.clear();
    return _stkListPerteOeuf = await DataBaseProvider.instance.getPerteOeuf();
  }

  Future<List<UsedOeufs>> _getConsOeuf() async {
    _stkListUsedOeuf.clear();
    return _stkListUsedOeuf = await DataBaseProvider.instance.getUsedOeuf();
  }

  Future<List<VenteOeuf>> _getVenteOeuf() async {
    _stkListVenteOeuf.clear();
    return _stkListVenteOeuf = await DataBaseProvider.instance.getVenteOeufs();
  }

  Future<List<Lot>> _getAllLot() async {
    _stkListAllLot.clear();
    return _stkListAllLot = await DataBaseProvider.instance.getLots();
  }

  Future<List<PerteVolailles>> _getMort() async {
    _stkListPerte.clear();
    return _stkListPerte = await DataBaseProvider.instance.getPerteVolailles();
  }

  Future<List<UsedVolailles>> _getConsVol() async {
    _stkListUsedVol.clear();
    return _stkListUsedVol = await DataBaseProvider.instance.getUsedVolailles();
  }

  Future<List<VenteVolailles>> _getVenteVol() async {
    _stkListVenteVol.clear();
    return _stkListVenteVol =
        await DataBaseProvider.instance.getVenteVolailles();
  }

  Future<List<CollecteOeuf>> _getCollecte() async {
    _stkListCollect.clear();
    return _stkListCollect = await DataBaseProvider.instance.getCollecteOeuf();
  }

  Future<List<EditStockVolailles>> _getEditVol() async {
    _stkListEditVol.clear();
    return _stkListEditVol =
        await DataBaseProvider.instance.getEditStockVolailles();
  }

  Future<List<EditStockOeuf>> _getEditOeuf() async {
    _stkListEditOeuf.clear();
    return _stkListEditOeuf =
        await DataBaseProvider.instance.getEditStockOeuf();
  }

  Future<List<InfoStock>> collecteInfoStock() async {
    listInfoStock.clear();
    await _getAllLot();
    await _getEditVol();
    await _getVenteVol();
    await _getMort();
    await _getConsVol();
    await _getCollecte();
    await _getEditOeuf();
    await _getPerteOeuf();
    await _getConsOeuf();
    await _getVenteOeuf();
    DateTime dateTime = _stkListAllLot[0].type == 0
        ? _stkListAllLot[0].buyAt
        : _stkListAllLot[0].createAt;
    /*var _newListEditVol = <EditStockVolailles>[];*/
    for (int i = 0; i <= DateTime.now().difOnlyDay(dateTime); i++) {
      _infoStock = InfoStock(DateTime.now(), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      _infoStock.dateAt = dateTime.add(Duration(days: i)).myDateTime();
      /*_stkListEditVol.every((e) {
        if (_newListEditVol.length == 0) {
          if (e.dateTime.isSameDate(_infoStock.dateAt)) {
            _newListEditVol.add(e);
          }
        } else {
          _newListEditVol.every((x) {
            if (e.lot.num == x.lot.num && x.dateTime.isSameDate(e.dateTime))
              x.qte = e.qte;
            return true;
          });
          if (_newListEditVol.every((x) =>
              x.lot.num != e.lot.num &&
              e.dateTime.isSameDate(_infoStock.dateAt))) _newListEditVol.add(e);
        }
        return true;
      });*/

      /// Effectif départ make
      if (listInfoStock.length == 0) {
        _stkListAllLot.every((e) {
          if (e.type == 0) {
            if (e.buyAt.isSameDate(_infoStock.dateAt)) {
              _infoStock.stkInitial += e.iniNbrVol;
              _infoStock.oeufEclore += e.iniNbrVol;
            }
            _stkListEditVol.every((x) {
              if (x.dateTime.isSameDate(_infoStock.dateAt) &&
                  x.lot.num == e.num &&
                  e.type == 0) {
                _infoStock.stkInitial -= x.lot.nmbrVolauillles;
                _infoStock.stkInitial += x.qte;
              }
              return true;
            });
          } else {
            if (e.createAt.isSameDate(_infoStock.dateAt)) {
              _infoStock.stkInitial += e.iniNbrVol;
            }
            _stkListEditVol.every((x) {
              if (x.dateTime.isSameDate(_infoStock.dateAt) &&
                  x.lot.num == e.num &&
                  e.type == 1) {
                _infoStock.stkInitial -= x.lot.nmbrVolauillles;
                _infoStock.stkInitial += x.qte;
              }
              return true;
            });
          }
          return true;
        });
      } else {
        _infoStock.stkInitial = listInfoStock[i - 1].stkFinal;
        _stkListAllLot.every((e) {
          if (e.type == 0) {
            if (e.buyAt.isSameDate(_infoStock.dateAt)) {
              _infoStock.stkInitial += e.iniNbrVol;
              _infoStock.oeufEclore += e.iniNbrVol;
            }
            _stkListEditVol.every((x) {
              if (x.dateTime.isSameDate(_infoStock.dateAt) &&
                  x.lot.num == e.num &&
                  e.type == 0) {
                _infoStock.stkInitial -= x.lot.nmbrVolauillles;
                _infoStock.stkInitial += x.qte;
              }
              return true;
            });
          } else {
            if (e.createAt.isSameDate(_infoStock.dateAt)) {
              _infoStock.stkInitial += e.iniNbrVol;
            }
            _stkListEditVol.every((x) {
              if (x.dateTime.isSameDate(_infoStock.dateAt) &&
                  x.lot.num == e.num &&
                  e.type == 1) {
                _infoStock.stkInitial -= x.lot.nmbrVolauillles;
                _infoStock.stkInitial += x.qte;
              }
              return true;
            });
          }
          return true;
        });
      }

      ///Perte Vol make
      _stkListPerte.every((e) {
        if (e.dateTime.isSameDate(_infoStock.dateAt))
          _infoStock.nbrMort += e.qte;
        return true;
      });

      ///Use Vol make
      _stkListUsedVol.every((e) {
        if (e.dateTime.isSameDate(_infoStock.dateAt))
          _infoStock.nbrCons += e.qte;
        return true;
      });

      ///Vente Vol make
      _stkListVenteVol.every((e) {
        if (e.dateTime.isSameDate(_infoStock.dateAt))
          _infoStock.nbrVendu += e.qte;
        return true;
      });

      ///Nbr Vol final
      _infoStock.stkFinal = _infoStock.stkInitial -
          (_infoStock.nbrMort + _infoStock.nbrCons + _infoStock.nbrVendu);

      /// oeuf initial
      if (listInfoStock.length > 0) {
        _infoStock.iPoeuf = listInfoStock[i - 1].sFinalPoeuf;
        _infoStock.iMoeuf = listInfoStock[i - 1].sFinalMoeuf;
        _infoStock.iGoeuf = listInfoStock[i - 1].sFinalGoeuf;

        _stkListEditOeuf.every((e) {
          if (e.dateTime.isSameDate(_infoStock.dateAt)) {
            _infoStock.iPoeuf -= e.stockOeuf.petits;
            _infoStock.iMoeuf -= e.stockOeuf.moyens;
            _infoStock.iGoeuf -= e.stockOeuf.grands;
            _infoStock.iPoeuf += e.petits;
            _infoStock.iMoeuf += e.moyens;
            _infoStock.iGoeuf += e.grands;
          }
          return true;
        });
      }

      ///Production oeufs
      _stkListCollect.every((e) {
        if (e.dateTime.isSameDate(_infoStock.dateAt)) {
          _infoStock.cPoeuf += e.petits;
          _infoStock.cMoeuf += e.moyens;
          _infoStock.cGoeuf += e.grands;
        }
        return true;
      });

      /// Vente oeufs
      _stkListVenteOeuf.every((e) {
        if (e.dateTime.isSameDate(_infoStock.dateAt)) {
          _infoStock.vPoeuf += e.petits;
          _infoStock.vMoeuf += e.moyens;
          _infoStock.vGoeuf += e.grands;
        }
        return true;
      });

      /// Consom oeufs
      _stkListUsedOeuf.every((e) {
        if (e.dateTime.isSameDate(_infoStock.dateAt)) {
          _infoStock.uPoeuf += e.petits;
          _infoStock.uMoeuf += e.moyens;
          _infoStock.uGoeuf += e.grands;
        }
        return true;
      });

      /// Perte oeufs
      _stkListPerteOeuf.every((e) {
        if (e.dateTime.isSameDate(_infoStock.dateAt)) {
          _infoStock.pPoeuf += e.petits;
          _infoStock.pMoeuf += e.moyens;
          _infoStock.pGoeuf += e.grands;
        }
        return true;
      });

      /// stock final oeuf
      _infoStock.sFinalPoeuf = (_infoStock.iPoeuf + _infoStock.cPoeuf) -
          (_infoStock.vPoeuf + _infoStock.uPoeuf + _infoStock.pPoeuf);
      _infoStock.sFinalMoeuf = (_infoStock.iMoeuf + _infoStock.cMoeuf) -
          (_infoStock.vMoeuf + _infoStock.uMoeuf + _infoStock.pMoeuf);
      _infoStock.sFinalGoeuf = (_infoStock.iGoeuf + _infoStock.cGoeuf) -
          (_infoStock.vGoeuf + _infoStock.uGoeuf + _infoStock.pGoeuf);

      ///add item in list
      listInfoStock.add(_infoStock);
    }
    print(listInfoStock.length);
    return listInfoStock;
  }
}
