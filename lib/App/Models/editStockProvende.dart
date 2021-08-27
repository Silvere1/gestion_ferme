import 'dart:convert';

import 'package:gestionferme/App/Models/provendeModel.dart';

class EditStockProvende {
  static final tableName = "EDITESTOCKPROVENDE";
  static final colid = "id";
  static final colProvende = "provende";
  static final colqte = "qte";
  static final colcreateAt = "createAt";

  int? num;
  Provende provende;
  double qte;
  DateTime createAt;
  EditStockProvende(this.num, this.provende, this.qte, this.createAt);

  EditStockProvende editStockProvendeFromJson(String str) =>
      EditStockProvende.fromJson(jsonDecode(str));
  String editStockProvendeToJson(EditStockProvende editStockProvende) =>
      jsonEncode(editStockProvende.toJson());

  factory EditStockProvende.fromJson(Map<String, dynamic> json) =>
      EditStockProvende(
        json[colid],
        Provende.fromJson(jsonDecode(json[colProvende])),
        json[colqte],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colProvende: jsonEncode(provende.toJson()),
        colqte: qte,
        colcreateAt: createAt.toIso8601String(),
      };
}
