import 'dart:convert';

import 'lotModel.dart';
import 'produitTraiteModel.dart';

class ConsomProdTraite {
  static final tableName = "CONSOMMEPRODUIT";
  static final colid = "id";
  static final colLot = "lot";
  static final colproduit = "produit";
  static final colqte = "qte";
  static final colcreateAt = "createAt";

  int? num;
  double qte;
  Produit produit;
  Lot lot;
  DateTime dateTime;
  ConsomProdTraite(this.num, this.lot, this.produit, this.qte, this.dateTime);

  ConsomProdTraite consomProdTraiteFromJson(String str) =>
      ConsomProdTraite.fromJson(jsonDecode(str));
  String consomProdTraiteToJson(ConsomProdTraite consomProdTraite) =>
      jsonEncode(consomProdTraite.toJson());

  factory ConsomProdTraite.fromJson(Map<String, dynamic> json) =>
      ConsomProdTraite(
        json[colid],
        Lot.fromJson(jsonDecode(json[colLot])),
        Produit.fromJson(jsonDecode(json[colproduit])),
        json[colqte],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colLot: jsonEncode(lot.toJson()),
        colproduit: jsonEncode(produit.toJson()),
        colqte: qte,
        colcreateAt: dateTime.toIso8601String(),
      };
}

/*List<ConsomProdTraite> consomprodtraite = [
   ConsomProdTraite(1, 1, produits[4], lots[2], DateTime(2021, 6, 23)),
  ConsomProdTraite(1, 1, produits[4], lots[2], DateTime(2021, 6, 23)),
  ConsomProdTraite(1, 1, produits[4], lots[2], DateTime(2021, 6, 23)),
  ConsomProdTraite(1, 1, produits[4], lots[2], DateTime(2021, 6, 23)),
  ConsomProdTraite(1, 1, produits[4], lots[2], DateTime(2021, 6, 23)),
];*/
