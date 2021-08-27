import 'dart:convert';

import 'package:gestionferme/App/Models/provendeModel.dart';

class ApproProvende {
  static final tableName = "APPROPROVENTE";
  static final colid = "id";
  static final colProvende = "provende";
  static final colisAdd = "isAdd";
  static final colqte = "qte";
  static final colvalue = "value";
  static final colcreateAt = "createAt";

  int? num;
  Provende provende;
  bool isAdd;
  double qte;
  double value;
  DateTime createAt;

  ApproProvende(
      this.num, this.provende, this.isAdd, this.qte, this.value, this.createAt);

  ApproProvende approProvendeFromJson(String str) =>
      ApproProvende.fromJson(jsonDecode(str));
  String approProvendeToJson(ApproProvende approProvende) =>
      jsonEncode(approProvende.toJson());

  factory ApproProvende.fromJson(Map<String, dynamic> json) => ApproProvende(
        json[colid],
        Provende.fromJson(jsonDecode(json[colProvende])),
        json[colisAdd] == 1 ? true : false,
        json[colqte],
        json[colvalue],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colProvende: jsonEncode(provende.toJson()),
        colisAdd: isAdd ? 1 : 0,
        colqte: qte,
        colvalue: value,
        colcreateAt: createAt.toIso8601String(),
      };
}
