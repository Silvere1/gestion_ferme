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

/*List<CollecteOeuf> collectoeuf = [
  */ /*CollecteOeuf(lots[2], 200, 90, 80, 7, DateTime(2021, 2, 4), 0),
  CollecteOeuf(lots[0], 10, 13, 8, 0, DateTime(2021, 12, 15), 1),
  CollecteOeuf(lots[3], 130, 13, 8, 8, DateTime(2021, 12, 15), 2),
  CollecteOeuf(lots[7], 150, 0, 8, 0, DateTime(2021, 12, 15), 3),
  CollecteOeuf(lots[1], 4, 13, 8, 2, DateTime(2021, 12, 15), 4),
  CollecteOeuf(lots[2], 10, 0, 8, 0, DateTime(2021, 12, 15), 5),
  CollecteOeuf(lots[6], 11, 13, 5, 9, DateTime(2021, 12, 15), 6),*/ /*
];*/
