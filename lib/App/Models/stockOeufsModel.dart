import 'dart:convert';

class StockOeuf {
  static final tableName = "STOCKOEUFS";
  static final colkey = "key";
  static final colpetits = "petits";
  static final colmoyens = "moyens";
  static final colgrands = "grands";
  static final coltotal = "total";

  String key;
  int petits;
  int moyens;
  int grands;
  int total;
  StockOeuf(this.key, this.petits, this.moyens, this.grands, this.total);

  StockOeuf stockOeufFromJson(String str) =>
      StockOeuf.fromJson(jsonDecode(str));
  String stockOeufToJson(StockOeuf stockOeuf) => jsonEncode(stockOeuf.toJson());

  factory StockOeuf.fromJson(Map<String, dynamic> json) => StockOeuf(
      json[colkey],
      json[colpetits],
      json[colmoyens],
      json[colgrands],
      json[coltotal]);

  Map<String, dynamic> toJson() => {
        colkey: key,
        colpetits: petits,
        colmoyens: moyens,
        colgrands: grands,
        coltotal: total,
      };
}
