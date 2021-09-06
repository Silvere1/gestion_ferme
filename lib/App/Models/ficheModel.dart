import 'package:gestionferme/App/Models/consomProdTraiteModel.dart';
import 'package:gestionferme/App/Models/consomProvendeModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';

class InfoDayVol {
  Lot lot;
  DateTime dateAt;
  int dayOfWeek;
  int effDepart;
  int nbrMort;
  int nbrVendu;
  int nbrCons;
  int effFinal;
  List<ConsomProvende> service1;
  List<ConsomProvende> service2;
  List<ConsomProvende> service3;
  List<TotalProvende> totalServices;
  double qteEau;
  int cP;
  int cM;
  int cG;
  int cF;
  int cT;
  double tauxPonte;
  List<ConsomProdTraite> traitement;
  List<TotalProduit> totalTraitement;

  InfoDayVol(
      this.lot,
      this.dateAt,
      this.dayOfWeek,
      this.effDepart,
      this.nbrMort,
      this.nbrVendu,
      this.nbrCons,
      this.effFinal,
      this.service1,
      this.service2,
      this.service3,
      this.totalServices,
      this.qteEau,
      this.cP,
      this.cM,
      this.cG,
      this.cF,
      this.cT,
      this.tauxPonte,
      this.traitement,
      this.totalTraitement);
}

class TotalProvende {
  int? num;
  String nom;
  double total;
  String unite;
  TotalProvende(this.num, this.nom, this.total, this.unite);
}

class TotalProduit {
  int? num;
  String nom;
  double total;
  String unite;
  TotalProduit(this.num, this.nom, this.total, this.unite);
}

class InfoStock {
  DateTime dateAt;
  int stkInitial;
  int poussins;
  int poulettes;
  int pondeuses;
  int poussinsF;
  int poulettesF;
  int pondeusesF;
  int nbrMort;
  int nbrVendu;
  int nbrCons;
  int stkFinal;
  int iPoeuf;
  int iMoeuf;
  int iGoeuf;
  int cPoeuf;
  int cMoeuf;
  int cGoeuf;
  int vPoeuf;
  int vMoeuf;
  int vGoeuf;
  int uPoeuf;
  int uMoeuf;
  int uGoeuf;
  int pPoeuf;
  int pMoeuf;
  int pGoeuf;
  int sFinalPoeuf;
  int sFinalMoeuf;
  int sFinalGoeuf;
  int oeufEclore;

  InfoStock(
      this.dateAt,
      this.stkInitial,
      this.poussins,
      this.poulettes,
      this.pondeuses,
      this.poussinsF,
      this.poulettesF,
      this.pondeusesF,
      this.nbrMort,
      this.nbrVendu,
      this.nbrCons,
      this.stkFinal,
      this.iPoeuf,
      this.iMoeuf,
      this.iGoeuf,
      this.cPoeuf,
      this.cMoeuf,
      this.cGoeuf,
      this.vPoeuf,
      this.vMoeuf,
      this.vGoeuf,
      this.uPoeuf,
      this.uMoeuf,
      this.uGoeuf,
      this.pPoeuf,
      this.pMoeuf,
      this.pGoeuf,
      this.sFinalPoeuf,
      this.sFinalMoeuf,
      this.sFinalGoeuf,
      this.oeufEclore);
}

class InfoPro {
  DateTime dateAt;
  List<Prod> prod;
  List<Prov> prov;
  InfoPro(this.dateAt, this.prod, this.prov);
}

class Prod {
  int? num;
  String nom;
  String unite;
  double iniQte;
  double approQte;
  double consQte;
  double finQte;
  Prod(this.num, this.nom, this.unite, this.iniQte, this.approQte, this.consQte,
      this.finQte);
}

class Prov {
  int? num;
  String nom;
  String unite;
  double iniQte;
  double approQte;
  double consQte;
  double finQte;
  Prov(this.num, this.nom, this.unite, this.iniQte, this.approQte, this.consQte,
      this.finQte);
}
