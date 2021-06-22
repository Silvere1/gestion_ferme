import 'uniteModel.dart';

class Produit {
  String? nom;
  String? unite;
  double? qte;
  double? value;
  String? createAt;
  Produit(this.nom, this.unite, this.qte, this.value, this.createAt);
}

List<Produit> produits = [
  Produit("Produits XX", unites[3].unite, 45, 5000, "01/01/2020"),
  Produit("Produits Anti-pou", unites[5].unite, 15, 6000, "01/01/2020"),
  Produit("Produits RV54", unites[4].unite, 155, 4000, "01/01/2020"),
  Produit("Produits Lotar", unites[2].unite, 715, 700, "01/01/2020"),
  Produit("Produits Save", unites[3].unite, 815, 2000, "01/01/2020"),
  Produit("Produits fase", unites[5].unite, 195, 9800, "01/01/2020"),
];
