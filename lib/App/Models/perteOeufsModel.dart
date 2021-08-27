import 'dart:convert';

class PerteOeufs {
  static final tableName = "PERTEOEUFS";
  static final colid = "id";
  static final colpetits = "petits";
  static final colmoyens = "moyens";
  static final colgrands = "grands";
  static final colmotif = "motif";
  static final colcreateAt = "createAt";

  int? num;
  int petits;
  int moyens;
  int grands;
  String motif;
  DateTime dateTime;
  PerteOeufs(this.num, this.petits, this.moyens, this.grands, this.motif,
      this.dateTime);

  PerteOeufs perteOeufsFromJson(String str) =>
      PerteOeufs.fromJson(jsonDecode(str));
  String perteOeufsToJson(PerteOeufs perteOeufs) =>
      jsonEncode(perteOeufs.toJson());

  factory PerteOeufs.fromJson(Map<String, dynamic> json) => PerteOeufs(
        json[colid],
        json[colpetits],
        json[colmoyens],
        json[colgrands],
        json[colmotif],
        DateTime.parse(json[colcreateAt]),
      );
  Map<String, dynamic> toJson() => {
        colid: num,
        colpetits: petits,
        colmoyens: moyens,
        colgrands: grands,
        colmotif: motif,
        colcreateAt: dateTime.toIso8601String(),
      };
}

/*
List<PerteOeufs> mespertesoeufs = [
  PerteOeufs(0, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(1, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(2, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(3, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(4, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(5, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(6, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(7, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
];
*/
