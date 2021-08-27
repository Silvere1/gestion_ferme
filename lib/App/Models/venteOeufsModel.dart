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

/*List<VenteOeuf> mesventesoeufs = [
  VenteOeuf(10, 0, 50, 4000, 0, DateTime(2021, 1, 8)),
  VenteOeuf(0, 100, 80, 6000, 1, DateTime(2021, 2, 10)),
  VenteOeuf(10, 10, 5, 1200, 2, DateTime(2021, 11, 30)),
  VenteOeuf(120, 0, 60, 15000, 3, DateTime(2021, 9, 12)),
  VenteOeuf(10, 0, 50, 7000, 4, DateTime(2021, 7, 23)),
  VenteOeuf(101, 77, 50, 9000, 5, DateTime(2021, 4, 17)),
  VenteOeuf(130, 70, 50, 8000, 6, DateTime(2021, 3, 18)),
];*/
