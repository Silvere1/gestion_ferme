import 'dart:convert';

import 'package:gestionferme/App/Models/lotModel.dart';

class VenteVolailles {
  static final tableName = "VENTEVOLAILLES";
  static final colid = "id";
  static final colLot = "lot";
  static final colqte = "nbrVolailles";
  static final colmontant = "montant";
  static final colcreateAt = "createAt";

  int? num;
  Lot lot;
  int qte;
  double montant;
  DateTime dateTime;
  VenteVolailles(this.num, this.lot, this.qte, this.montant, this.dateTime);

  VenteVolailles venteVolaillesFromJson(String str) =>
      VenteVolailles.fromJson(jsonDecode(str));
  String venteVolaillesToJson(VenteVolailles venteVolailles) =>
      jsonEncode(venteVolailles.toJson());

  factory VenteVolailles.fromJson(Map<String, dynamic> json) => VenteVolailles(
        json[colid],
        Lot.fromJson(jsonDecode(json[colLot])),
        json[colqte],
        json[colmontant],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colLot: jsonEncode(lot.toJson()),
        colqte: qte,
        colmontant: montant,
        colcreateAt: dateTime.toIso8601String(),
      };
}
