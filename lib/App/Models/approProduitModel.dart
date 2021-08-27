import 'dart:convert';

import 'produitTraiteModel.dart';

class ApproProduit {
  static final tableName = "APPROPRODUIT";
  static final colid = "id";
  static final colProduit = "produit";
  static final colisAdd = "isAdd";
  static final colqte = "qte";
  static final colvalue = "value";
  static final colcreateAt = "createAt";

  int? num;
  Produit produit;
  bool isAdd;
  double qte;
  double value;
  DateTime createAt;
  ApproProduit(
      this.num, this.produit, this.isAdd, this.qte, this.value, this.createAt);

  ApproProduit approProduitFromJson(String str) =>
      ApproProduit.fromJson(jsonDecode(str));
  String approProduitToJson(ApproProduit approProduit) =>
      jsonEncode(approProduit.toJson());

  factory ApproProduit.fromJson(Map<String, dynamic> json) => ApproProduit(
        json[colid],
        Produit.fromJson(jsonDecode(json[colProduit])),
        json[colisAdd] == 1 ? true : false,
        json[colqte],
        json[colvalue],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colProduit: jsonEncode(produit.toJson()),
        colisAdd: isAdd ? 1 : 0,
        colqte: qte,
        colvalue: value,
        colcreateAt: createAt.toIso8601String(),
      };
}
