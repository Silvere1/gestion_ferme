import 'dart:convert';

class Lot {
  static final tableName = "LOTS";
  static final colid = "id";
  static final colinitNbr = "initNbrVol";
  static final colnbrVolailles = "nbrVolailles";
  static final colage = "age";
  static final colcreateAt = "createAt";
  static final colbuyAt = "buyAt";
  static final coltype = "type";
  static final colmontant = "montant";
  static final colselect = "selected";
  static final colarchive = "archive";
  static final colarchiveAt = "archiveAt";

  int? num;
  int iniNbrVol;
  int nmbrVolauillles;
  int age;
  DateTime createAt;
  DateTime buyAt;
  int type;
  int montant;
  bool select;
  int archive;
  DateTime archiveAt;
  Lot(
      this.num,
      this.iniNbrVol,
      this.nmbrVolauillles,
      this.age,
      this.createAt,
      this.buyAt,
      this.type,
      this.montant,
      this.select,
      this.archive,
      this.archiveAt);

  Lot lotFromJson(String str) => Lot.fromJson(jsonDecode(str));
  String lotToJson(Lot lot) => jsonEncode(lot.toJson());

  factory Lot.fromJson(Map<String, dynamic> json) => Lot(
      json[colid],
      json[colinitNbr],
      json[colnbrVolailles],
      json[colage],
      DateTime.parse(json[colcreateAt]),
      DateTime.parse(json[colbuyAt]),
      json[coltype],
      json[colmontant],
      json[colselect] == 1,
      json[colarchive],
      DateTime.parse(json[colarchiveAt]));

  Map<String, dynamic> toJson() => {
        colid: num,
        colinitNbr: iniNbrVol,
        colnbrVolailles: nmbrVolauillles,
        colage: age,
        colcreateAt: createAt.toIso8601String(),
        colbuyAt: buyAt.toIso8601String(),
        coltype: type,
        colmontant: montant,
        colselect: select ? 1 : 0,
        colarchive: archive,
        colarchiveAt: archiveAt.toIso8601String(),
      };
}
