import 'dart:convert';

import 'stockOeufsModel.dart';

class EditStockOeuf {
  static final tableName = "EDITESTOCKOEUF";
  static final colid = "id";
  static final colpetits = "petits";
  static final colmoyens = "moyens";
  static final colgrands = "grands";
  static final colStock = "lastStock";
  static final colcreateAt = "createAt";

  int? num;
  StockOeuf stockOeuf;
  int petits;
  int moyens;
  int grands;
  DateTime dateTime;
  EditStockOeuf(this.num, this.stockOeuf, this.petits, this.moyens, this.grands,
      this.dateTime);

  EditStockOeuf editStockOeufFromJson(String str) =>
      EditStockOeuf.fromJson(jsonDecode(str));
  String editStockOeufToJson(EditStockOeuf editStockOeuf) =>
      jsonEncode(editStockOeuf.toJson());

  factory EditStockOeuf.fromJson(Map<String, dynamic> json) => EditStockOeuf(
        json[colid],
        StockOeuf.fromJson(jsonDecode(json[colStock])),
        json[colpetits],
        json[colmoyens],
        json[colgrands],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colStock: jsonEncode(stockOeuf.toJson()),
        colpetits: petits,
        colmoyens: moyens,
        colgrands: grands,
        colcreateAt: dateTime.toIso8601String(),
      };
}
