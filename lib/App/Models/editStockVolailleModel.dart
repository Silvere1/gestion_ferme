import 'dart:convert';

import 'lotModel.dart';

class EditStockVolailles {
  static final tableName = "EDITESTOCKVOLAILLES";
  static final colid = "id";
  static final colLot = "lot";
  static final colqte = "qte";
  static final colcreateAt = "createAt";

  int? num;
  Lot lot;
  int qte;
  DateTime dateTime;
  EditStockVolailles(this.num, this.lot, this.qte, this.dateTime);

  EditStockVolailles editStockVolaillesFromJson(String str) =>
      EditStockVolailles.fromJson(jsonDecode(str));
  String editStockVolaillesToJson(EditStockVolailles editStockVolailles) =>
      jsonEncode(editStockVolailles.toJson());

  factory EditStockVolailles.fromJson(Map<String, dynamic> json) =>
      EditStockVolailles(
        json[colid],
        Lot.fromJson(jsonDecode(json[colLot])),
        json[colqte],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colLot: jsonEncode(lot.toJson()),
        colqte: qte,
        colcreateAt: dateTime.toIso8601String(),
      };
}

/*List<EditStockVolailles> editstockvolailles = [
*/ /*  EditStockVolailles(1, lots[0], 3, false, DateTime(2021, 2, 12)),
  EditStockVolailles(1, lots[0], 3, false, DateTime(2021, 2, 12)),
  EditStockVolailles(1, lots[0], 3, true, DateTime(2021, 2, 12)),
  EditStockVolailles(1, lots[0], 3, false, DateTime(2021, 2, 12)),
  EditStockVolailles(1, lots[0], 3, true, DateTime(2021, 2, 12)),*/ /*
];*/
