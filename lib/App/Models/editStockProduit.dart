import 'dart:convert';

import 'package:gestionferme/App/Models/produitTraiteModel.dart';

class EditStockProduit {
  static final tableName = "EDITESTOCKPRODUIT";
  static final colid = "id";
  static final colProduit = "produit";
  static final colqte = "qte";
  static final colcreateAt = "createAt";

  int? num;
  Produit produit;
  double qte;
  DateTime createAt;
  EditStockProduit(this.num, this.produit, this.qte, this.createAt);

  EditStockProduit editStockProduitFromJson(String str) =>
      EditStockProduit.fromJson(jsonDecode(str));
  String editStockProduitToJson(EditStockProduit editStockProduit) =>
      jsonEncode(editStockProduit.toJson());

  factory EditStockProduit.fromJson(Map<String, dynamic> json) =>
      EditStockProduit(
        json[colid],
        Produit.fromJson(jsonDecode(json[colProduit])),
        json[colqte],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colProduit: jsonEncode(produit.toJson()),
        colqte: qte,
        colcreateAt: createAt.toIso8601String(),
      };
}
