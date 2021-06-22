import 'uniteModel.dart';

class Provende {
  String? nom;
  String? unite;
  double? qte;
  double? value;
  String? createAt;
  Provende(this.nom, this.unite, this.qte, this.value, this.createAt);
}

List<Provende> provendes = [
  Provende("Provende Poussins", unites[0].unite, 54, 5200, "02/01/2020"),
  Provende("Provende X34", unites[0].unite, 154, 59000, "02/01/2020"),
  Provende("Provende Pondeuses", unites[0].unite, 224, 6700, "02/01/2020"),
  Provende("Provende Engrossistement", unites[0].unite, 60, 9900, "02/01/2020"),
  Provende("Provende 20jours", unites[2].unite, 904, 8200, "02/01/2020"),
  Provende("Provende Z45", unites[1].unite, 574, 7000, "02/01/2020"),
];
