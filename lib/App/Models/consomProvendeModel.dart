import 'dart:convert';

import 'lotModel.dart';
import 'provendeModel.dart';

class ConsomProvende {
  static final tableName = "CONSOMMEPROVENDE";
  static final colid = "id";
  static final colLot = "lot";
  static final colProvende = "provende";
  static final colqte = "qte";
  static final colOrderService = "orderService";
  static final colcreateAt = "createAt";

  int? num;
  Lot lot;
  Provende provende;
  double qte;
  int orderService;
  DateTime dateTime;
  ConsomProvende(this.num, this.lot, this.provende, this.qte, this.orderService,
      this.dateTime);

  ConsomProvende consomProvendeFromJson(String str) =>
      ConsomProvende.fromJson(jsonDecode(str));
  String consomProvendeToJson(ConsomProvende consomProvende) =>
      jsonEncode(consomProvende.toJson());

  factory ConsomProvende.fromJson(Map<String, dynamic> json) => ConsomProvende(
        json[colid],
        Lot.fromJson(jsonDecode(json[colLot])),
        Provende.fromJson(jsonDecode(json[colProvende])),
        json[colqte],
        json[colOrderService],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colLot: jsonEncode(lot.toJson()),
        colProvende: jsonEncode(provende.toJson()),
        colqte: qte,
        colOrderService: orderService,
        colcreateAt: dateTime.toIso8601String(),
      };
}
