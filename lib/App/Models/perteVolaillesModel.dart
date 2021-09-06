import 'dart:convert';

import 'lotModel.dart';

class PerteVolailles {
  static final tableName = "PERTEVOLAILLES";
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
  PerteVolailles(this.num, this.lot, this.qte, this.motif, this.dateTime);

  PerteVolailles perteVolaillesFromJson(String str) =>
      PerteVolailles.fromJson(jsonDecode(str));
  String perteVolaillesToJson(PerteVolailles perteVolailles) =>
      jsonEncode(perteVolailles.toJson());

  factory PerteVolailles.fromJson(Map<String, dynamic> json) => PerteVolailles(
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
