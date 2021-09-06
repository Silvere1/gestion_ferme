import 'dart:convert';

class VenteOeuf {
  static final tableName = "VENTEOEUFS";
  static final colid = "id";
  static final colpetits = "petits";
  static final colmoyens = "moyens";
  static final colgrands = "grands";
  static final colmontant = "montant";
  static final colcreateAt = "createAt";

  int petits;
  int moyens;
  int grands;
  double montant;
  int? num;
  DateTime dateTime;
  VenteOeuf(this.num, this.petits, this.moyens, this.grands, this.montant,
      this.dateTime);

  VenteOeuf venteOeufFromJson(String str) =>
      VenteOeuf.fromJson(jsonDecode(str));
  String venteOeufToJson(VenteOeuf venteOeuf) => jsonEncode(venteOeuf.toJson());

  factory VenteOeuf.fromJson(Map<String, dynamic> json) => VenteOeuf(
        json[colid],
        json[colpetits],
        json[colmoyens],
        json[colgrands],
        json[colmontant],
        DateTime.parse(json[colcreateAt]),
      );
  Map<String, dynamic> toJson() => {
        colid: num,
        colpetits: petits,
        colmoyens: moyens,
        colgrands: grands,
        colmontant: montant,
        colcreateAt: dateTime.toIso8601String(),
      };
}
