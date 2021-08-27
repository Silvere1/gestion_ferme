import 'dart:convert';

class Produit {
  static final tableName = "PRODUITS";
  static final colid = "id";
  static final colnom = "nom";
  static final colunite = "unite";
  static final colqte = "qte";
  static final colvalue = "value";
  static final colcreateAt = "createAt";

  int? num;
  String nom;
  String unite;
  double qte;
  double value;
  DateTime createAt;
  Produit(this.num, this.nom, this.unite, this.qte, this.value, this.createAt);

  Produit produitFromJson(String str) => Produit.fromJson(jsonDecode(str));
  String produitToJson(Produit produit) => jsonEncode(produit.toJson());

  factory Produit.fromJson(Map<String, dynamic> json) => Produit(
        json[colid],
        json[colnom],
        json[colunite],
        json[colqte],
        json[colvalue],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colnom: nom,
        colunite: unite,
        colqte: qte,
        colvalue: value,
        colcreateAt: createAt.toIso8601String(),
      };
}
/*
List<Produit> produits = [
  */ /*Produit("Produits XX", unites[3].unite, 45, 5000, "01/01/2020"),
  Produit("Produits Anti-pou", unites[5].unite, 15, 6000, "01/01/2020"),
  Produit("Produits RV54", unites[4].unite, 155, 4000, "01/01/2020"),
  Produit("Produits Lotar", unites[2].unite, 715, 700, "01/01/2020"),
  Produit("Produits Save", unites[3].unite, 815, 2000, "01/01/2020"),
  Produit("Produits fase", unites[5].unite, 195, 9800, "01/01/2020"),*/ /*
];*/
