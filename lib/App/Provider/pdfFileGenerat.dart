import 'package:flutter/services.dart';
import 'package:gestionferme/App/Controllers/ficheController.dart';
import 'package:gestionferme/App/Models/ficheModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Provider/savePdf.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '/App/date.dart';

class PdfApi {
  static FicheController controller = Get.find();
  /*static var myFont = Font.courier();*/
  /*static Future<void> _intitDateFormater() async {
    initializeDateFormatting();
  }*/

  static Future<void> generatePdf(List<InfoDayVol> infoDayVol) async {
    /*await _intitDateFormater();*/
    final image = (await rootBundle.load("assets/icons/Logo GF (3).png"))
        .buffer
        .asUint8List();
    final _pdf = Document();

    _pdf.addPage(
      MultiPage(
        /*orientation: PageOrientation.landscape,*/
        pageFormat: PdfPageFormat(
            29.7 * PdfPageFormat.cm, 21.0 * PdfPageFormat.cm,
            marginAll: 1.2 * PdfPageFormat.cm),
        build: (_) => [
          buildTitle(infoDayVol[0].lot, image),
          buildHeadTble1(infoDayVol),
          buildTable1(infoDayVol),
          SizedBox(height: 20),
          buildHeadTble2(),
          buildTable2(infoDayVol),
        ],
        header: (_) => buildHead(),
        footer: (_) => buildFoot(_, image),
      ),
    );
    _pdf.addPage(
      MultiPage(
        build: (_) => [
          buildTitleBilan(infoDayVol[0].lot),
          buildBilan(infoDayVol[0]),
        ],
        header: (_) => buildHeadBilan(infoDayVol[0].lot.num!.toInt()),
        footer: (_) => buildFoot(_, image),
      ),
    );

    await SavePdf.saveDoc(
        "Fiche de survie lot ${infoDayVol[0].lot.num}.pdf", _pdf);
  }

  static var dateFormat = DateFormat.yMMMMd('fr');

  static Widget buildFoot(Context _, var image) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Image(MemoryImage(image), width: 26),
            Text("Généré par l'application mobile: GestionFerme",
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: PdfColors.grey)),
          ]),
          Text("page ${_.pageNumber} sur ${_.pagesCount}",
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: PdfColors.grey)),
        ],
      );
  static Widget buildHead() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Fiche de suvi journalier",
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: PdfColors.grey)),
        ],
      );
  static Widget buildHeadBilan(int num) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Bilan de suvi du lot N°: $num",
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: PdfColors.grey)),
        ],
      );

  static Widget buildHeadTble1(List<InfoDayVol> infoDayVol) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 30,
              child: Center(
                child: Text(infoDayVol.length % 7 == 0 &&
                        infoDayVol.length ~/ 7 > 0
                    ? "${(infoDayVol.length ~/ 7).toInt()} semane(s)"
                    : infoDayVol.length ~/ 7 > 0 && infoDayVol.length % 7 != 0
                        ? "${(infoDayVol.length ~/ 7).toInt()} semaine(s)\n${infoDayVol.length % 7} jour(s)"
                        : "${infoDayVol.length % 7} jour(s)"),
              ),
              decoration: BoxDecoration(
                color: PdfColors.green600,
              ),
            ),
          ),
          Container(
            height: 30,
            width: 279,
            child: Center(
              child: Text("Volailles"),
            ),
            decoration: BoxDecoration(
              color: PdfColors.green400,
            ),
          ),
          Container(
            height: 30,
            width: 399,
            child: Center(
              child: Text("Oeufs"),
            ),
            decoration: BoxDecoration(
              color: PdfColors.green200,
            ),
          ),
        ],
      );
  static Widget buildHeadTble2() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 30,
              width: 429,
              child: Center(
                child: Text("Alimentations"),
              ),
              decoration: BoxDecoration(
                color: PdfColors.green400,
              ),
            ),
          ),
          Container(
            height: 30,
            width: 234,
            child: Center(
              child: Text("Traitements"),
            ),
            decoration: BoxDecoration(
              color: PdfColors.green200,
            ),
          ),
        ],
      );

  static Widget buildTitle(Lot lot, var image) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Le ${dateFormat.format(DateTime.now())}"),
              Text("Lot N°: ${lot.num}",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  )),
              Image(MemoryImage(image), width: 55),
            ],
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );
  static Widget buildTitleBilan(Lot lot) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Bilan",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
              )),
          Row(children: [
            Expanded(
                child: Container(
              color: PdfColors.green,
              height: 2,
            )),
          ]),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Lot N°: ${lot.num}"),
            Text("le ${dateFormat.format(DateTime.now())}"),
          ]),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(lot.type == 0
                      ? "Eclore le ${dateFormat.format(lot.buyAt)}"
                      : "Acheté le ${dateFormat.format(lot.buyAt)} à "
                          "l'âge de ${lot.age - lot.createAt.difOnlyDay(lot.buyAt)} "
                          "jour(s), à ${lot.montant} fcfa."),
                  SizedBox(height: 10),
                  Text(
                      "Âge actuel: ${lot.age + DateTime.now().difOnlyDay(lot.createAt)} jour(s)"),
                ],
              ),
            ],
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );
  static Widget buildBilan(InfoDayVol infoDayVol) => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: PdfColors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text("Nombre de volailles disponibles",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 2, color: PdfColors.green),
                    )),
                    padding: EdgeInsets.only(left: 6, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                        "- ${controller.listInfoDayVol.last.lot.nmbrVolauillles} volaille(s)")),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: PdfColors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text("Nombre total d'oeufs produit",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 2, color: PdfColors.green),
                    )),
                    padding: EdgeInsets.only(left: 6, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                        "- ${controller.totalOeufs} oeuf(s), soit ${controller.totalOeufs ~/ 12} douzaine(s)")),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: PdfColors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text("Alimentation en Eau",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 2, color: PdfColors.green),
                    )),
                    padding: EdgeInsets.only(left: 6, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 3),
                    child: Text("- ${controller.totalEau} litre(s)")),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: PdfColors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text("Alimentations en Provendes",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 2, color: PdfColors.green),
                    )),
                    padding: EdgeInsets.only(left: 6, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 3),
                    child: buildTotalProvend()),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: PdfColors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text("Traitements effectués",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 2, color: PdfColors.green),
                    )),
                    padding: EdgeInsets.only(left: 6, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 3),
                    child: buildTotalProduit()),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: PdfColors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text("Réajustements du stock",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                    left: BorderSide(width: 2, color: PdfColors.green),
                  )),
                  padding: EdgeInsets.only(left: 6, top: 4, bottom: 4),
                  margin: EdgeInsets.only(left: 3),
                  child: controller.listEditeStockVol.length != 0
                      ? ListView.builder(
                          spacing: 1,
                          itemBuilder: (_, i) => Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  "- De ${controller.listEditeStockVol[i].lot.nmbrVolauillles}"
                                  " à ${controller.listEditeStockVol[i].qte} volaille(s)"
                                  " le ${dateFormat.format(controller.listEditeStockVol[i].dateTime)}"),
                            ],
                          ),
                          itemCount: controller.listEditeStockVol.length,
                        )
                      : Text("  Aucun réajustement n'est effectué sur ce lot."),
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: PdfColors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text("Pertes de volailles",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 2, color: PdfColors.green),
                    )),
                    padding: EdgeInsets.only(left: 6, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 3),
                    child: Text("- ${controller.totalMort} volaille(s)")),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: PdfColors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text("Volailles vendues",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 2, color: PdfColors.green),
                    )),
                    padding: EdgeInsets.only(left: 6, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 3),
                    child: Text("- ${controller.totalVendu} volaille(s)")),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        color: PdfColors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text("Volailles mangées",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: 2, color: PdfColors.green),
                    )),
                    padding: EdgeInsets.only(left: 6, top: 4, bottom: 4),
                    margin: EdgeInsets.only(left: 3),
                    child: Text("- ${controller.totalManger} volaille(s)")),
              ],
            ),
          ),
          Column(
            children: [
              _Percent(
                  size: 66,
                  value: controller.totalMort / infoDayVol.lot.nmbrVolauillles,
                  title: Text("Mortalité"))
            ],
          ),
        ],
      );

  static Widget buildTotalProvend() {
    return controller.bilanConsProv.length != 0
        ? ListView.builder(
            itemBuilder: (_, i) =>
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("- ${controller.bilanConsProv[i].total}"
                  " ${controller.bilanConsProv[i].unite}"
                  " de ${controller.bilanConsProv[i].nom}")
            ]),
            itemCount: controller.bilanConsProv.length,
          )
        : Text(
            " Aucune alimentation de provende n'est enregistrée pour ce lot.");
  }

  static Widget buildTotalProduit() {
    return controller.bilanTraite.length != 0
        ? ListView.builder(
            itemBuilder: (_, i) =>
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("- ${controller.bilanTraite[i].total}"
                  " ${controller.bilanTraite[i].unite}"
                  " de ${controller.bilanTraite[i].nom}")
            ]),
            itemCount: controller.bilanTraite.length,
          )
        : Text(" Aucun traitement n'est enregistrée pour ce lot.");
  }

  static Widget buildTable1(List<InfoDayVol> infoDayVol) {
    final headers = [
      "Date",
      "Nbre\njours",
      "Effect\ndépart",
      "Morts",
      "Vendus",
      "Mangés",
      "Effect\nfinal",
      "Petits",
      "Moyens",
      "Grands",
      "Fêlés",
      "Total",
      "Plateaux",
      "Taux de\nponte",
    ];
    final data = infoDayVol.map((e) {
      return [
        "${e.dateAt.day}/${e.dateAt.month}/${e.dateAt.year.toString().replaceRange(0, 2, "")}",
        "${e.dayOfWeek}",
        "${e.effDepart}",
        "${e.nbrMort}",
        "${e.nbrVendu}",
        "${e.nbrCons}",
        "${e.effFinal}",
        "${e.cP}",
        "${e.cM}",
        "${e.cG}",
        "${e.cF}",
        "${e.cT}",
        "${(e.cT / 12).toPrecision(1)}",
        "${e.tauxPonte.toPrecision(2)}",
      ];
    }).toList();
    return Table.fromTextArray(
      headers: headers,
      headerStyle:
          TextStyle(fontWeight: FontWeight.bold, color: PdfColors.white),
      cellStyle: TextStyle(fontSize: 10),
      headerDecoration: BoxDecoration(
        color: PdfColor.fromHex("006A34"),
      ),

      /*headerStyle: TextStyle(fontSize: 10),*/
      data: data,
    );
  }

  static Widget buildTable2(List<InfoDayVol> infoDayVol) {
    final headers = [
      "Date",
      "1er service",
      "2è service",
      "3è service",
      "  Total  ",
      "Qte Eau",
      "Traitements",
      "Total / traite",
    ];
    final data = infoDayVol.map((e) {
      return [
        "${e.dateAt.day}/${e.dateAt.month}/${e.dateAt.year.toString().replaceRange(0, 2, "")}",
        e.service1
            .map((x) => "${x.provende.nom}: ${x.qte} ${x.provende.unite}\n")
            .toList()
            .toString()
            .replaceRange(0, 1, " ")
            .replaceAll("[", "")
            .replaceAll("]", "")
            .replaceAll(",", ""),
        e.service2
            .map((x) => "${x.provende.nom}: ${x.qte} ${x.provende.unite}\n")
            .toList()
            .toString()
            .replaceRange(0, 1, " ")
            .replaceAll("[", "")
            .replaceAll("]", "")
            .replaceAll(",", ""),
        e.service3
            .map((x) => "${x.provende.nom}: ${x.qte} ${x.provende.unite}\n")
            .toList()
            .toString()
            .replaceRange(0, 1, " ")
            .replaceAll("[", "")
            .replaceAll("]", "")
            .replaceAll(",", ""),
        e.totalServices
            .map((x) => "${x.nom}: ${x.total} ${x.unite}\n")
            .toList()
            .toString()
            .replaceRange(0, 1, " ")
            .replaceAll("[", "")
            .replaceAll("]", "")
            .replaceAll(",", ""),
        "${e.qteEau} l",
        e.traitement
            .map((x) => "${x.produit.nom}: ${x.qte} ${x.produit.unite}\n")
            .toList()
            .toString()
            .replaceRange(0, 1, " ")
            .replaceAll("[", "")
            .replaceAll("]", "")
            .replaceAll(",", ""),
        e.totalTraitement
            .map((x) => "${x.nom}: ${x.total} ${x.unite}\n")
            .toList()
            .toString()
            .replaceRange(0, 1, " ")
            .replaceAll("[", "")
            .replaceAll("]", "")
            .replaceAll(",", ""),
      ];
    }).toList();
    return Table.fromTextArray(
      headers: headers,
      /*headerStyle: TextStyle(fontSize: 10),*/
      headerStyle:
          TextStyle(fontWeight: FontWeight.bold, color: PdfColors.white),
      cellStyle: TextStyle(fontSize: 10),
      headerDecoration: BoxDecoration(
        color: PdfColor.fromHex("006A34"),
      ),
      cellAlignment: Alignment.centerLeft,
      data: data,
    );
  }
}

class _Percent extends StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
    this.fontSize = 1.2,
    this.color = PdfColors.green,
    this.backgroundColor = PdfColors.grey300,
    this.strokeWidth = 5,
  });

  final double size;

  final double value;

  final Widget title;

  final double fontSize;

  final PdfColor color;

  final PdfColor backgroundColor;

  final double strokeWidth;

  @override
  Widget build(Context context) {
    final widgets = <Widget>[
      Container(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Text(
                '${(value * 100).toPrecision(1)}%',
                textScaleFactor: fontSize,
              ),
            ),
            CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return Column(children: widgets);
  }
}
