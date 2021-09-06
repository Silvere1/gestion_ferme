import 'dart:convert';

import 'lotModel.dart';

class UsedVolailles {
  static final tableName = "USEDVOLAILLES";
  static final colid = "id";
  static final colLot = "lot";
  static final colqte = "nbrVolailles";
  static final colmotif = "motif";
  static final colcreateAt = "createAt";

  int? num;
  Lot lot;
  int qte;
  String motif;
  DateTime dateTime;
  UsedVolailles(this.num, this.lot, this.qte, this.motif, this.dateTime);

  UsedVolailles usedVolaillesFromJson(String str) =>
      UsedVolailles.fromJson(jsonDecode(str));
  String usedVolaillesToJson(UsedVolailles usedVolailles) =>
      jsonEncode(usedVolailles.toJson());

  factory UsedVolailles.fromJson(Map<String, dynamic> json) => UsedVolailles(
        json[colid],
        Lot.fromJson(jsonDecode(json[colLot])),
        json[colqte],
        json[colmotif],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colLot: jsonEncode(lot.toJson()),
        colqte: qte,
        colmotif: motif,
        colcreateAt: dateTime.toIso8601String(),
      };
}
