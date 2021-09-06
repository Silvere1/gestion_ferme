import 'dart:convert';

class Provende {
  static final tableName = "PROVENDES";
  static final colid = "id";
  static final colnom = "nom";
  static final colunite = "unite";
  static final colqte = "qte";
  static final colvalue = "value";
  static final colcreateAt = "createAt";

  int? num;
  String nom;
  String unite;
  double qte;
  double? value;
  DateTime createAt;
  Provende(this.num, this.nom, this.unite, this.qte, this.value, this.createAt);

  Provende provendeFromJson(String str) => Provende.fromJson(jsonDecode(str));
  String provendeToJson(Provende provende) => jsonEncode(provende.toJson());

  factory Provende.fromJson(Map<String, dynamic> json) => Provende(
        json[colid],
        json[colnom],
        json[colunite],
        json[colqte],
        json[colvalue],
        DateTime.parse(json[colcreateAt]),
      );

  Map<String, dynamic> toJson() => {
        colid: num,
        colnom: nom,
        colunite: unite,
        colqte: qte,
        colvalue: value,
        colcreateAt: createAt.toIso8601String(),
      };
}
