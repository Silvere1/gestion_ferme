import 'dart:convert';

import 'lotModel.dart';

class ConsomEau {
  static final tableName = "CONSOMMEEAU";
  static final colid = "id";
  static final colLot = "lot";
  static final colqte = "qte";
  static final colcreateAt = "createAt";

  int? num;
  double qte;
  Lot lot;
  DateTime dateTime;
  ConsomEau(this.num, this.qte, this.lot, this.dateTime);

  ConsomEau consomEauFromJson(String str) =>
      ConsomEau.fromJson(jsonDecode(str));
  String consomEauToJson(ConsomEau consomEau) => jsonEncode(consomEau.toJson());

  factory ConsomEau.fromJson(Map<String, dynamic> json) => ConsomEau(
        json[colid],
        json[colqte],
        Lot.fromJson(jsonDecode(json[colLot])),
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colqte: qte,
        colLot: jsonEncode(lot.toJson()),
        colcreateAt: dateTime.toIso8601String(),
      };
}

/*List<ConsomEau> consomeau = [
  ConsomEau(1, 2, lots[3], DateTime(2021, 3, 4)),
  ConsomEau(1, 2, lots[3], DateTime(2021, 3, 4)),
  ConsomEau(1, 2, lots[3], DateTime(2021, 3, 4)),
  ConsomEau(1, 2, lots[3], DateTime(2021, 3, 4)),
  ConsomEau(1, 2, lots[3], DateTime(2021, 3, 4)),
];*/
