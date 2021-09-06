import 'dart:convert';

import 'lotModel.dart';

class CollecteOeuf {
  static final tableName = "COLLECTEOEUFS";
  static final colid = "id";
  static final colLot = "lot";
  static final colpetits = "petits";
  static final colmoyens = "moyens";
  static final colgrands = "grands";
  static final colfeles = "feles";
  static final colcreateAt = "createAt";

  int? num;
  Lot lot;
  int petits;
  int moyens;
  int grands;
  int feles;
  DateTime dateTime;

  CollecteOeuf(this.num, this.lot, this.petits, this.moyens, this.grands,
      this.feles, this.dateTime);

  CollecteOeuf collecteOeufFromJson(String str) =>
      CollecteOeuf.fromJson(jsonDecode(str));
  String collecteOeufToJson(CollecteOeuf collecteOeuf) =>
      jsonEncode(collecteOeuf.toJson());

  factory CollecteOeuf.fromJson(Map<String, dynamic> json) => CollecteOeuf(
        json[colid],
        Lot.fromJson(jsonDecode(json[colLot])),
        json[colpetits],
        json[colmoyens],
        json[colgrands],
        json[colfeles],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colLot: jsonEncode(lot.toJson()),
        colpetits: petits,
        colmoyens: moyens,
        colgrands: grands,
        colfeles: feles,
        colcreateAt: dateTime.toIso8601String(),
      };
}
