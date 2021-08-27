import 'dart:convert';

class UsedOeufs {
  static final tableName = "USEDOEUFS";
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
  UsedOeufs(this.num, this.petits, this.moyens, this.grands, this.motif,
      this.dateTime);

  UsedOeufs usedOeufsFromJson(String str) =>
      UsedOeufs.fromJson(jsonDecode(str));
  String usedOeufsToJson(UsedOeufs usedOeufs) => jsonEncode(usedOeufs.toJson());

  factory UsedOeufs.fromJson(Map<String, dynamic> json) => UsedOeufs(
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

/*List<UsedOeufs> myusageoeuf = [
  UsedOeufs(0, 2, 0, 10, "J'ai faim", DateTime(2021, 2, 14)),
  UsedOeufs(0, 2, 0, 10, "Sous odre du boss", DateTime(2021, 2, 14)),
  UsedOeufs(0, 2, 0, 10, "J'ai faim", DateTime(2021, 2, 14)),
  UsedOeufs(0, 2, 0, 10, "J'ai faim", DateTime(2021, 2, 14)),
  UsedOeufs(0, 2, 0, 10, "J'ai faim", DateTime(2021, 2, 14)),
  UsedOeufs(0, 2, 0, 10, "J'ai faim", DateTime(2021, 2, 14)),
  UsedOeufs(0, 2, 0, 10, "J'ai faim", DateTime(2021, 2, 14)),
  UsedOeufs(0, 2, 0, 10, "J'ai faim", DateTime(2021, 2, 14)),
  UsedOeufs(0, 2, 0, 10, "J'ai faim", DateTime(2021, 2, 14)),
];*/
