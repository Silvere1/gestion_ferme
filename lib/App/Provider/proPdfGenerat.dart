import 'package:flutter/services.dart';
import 'package:gestionferme/App/Controllers/proFicheController.dart';
import 'package:gestionferme/App/Models/ficheModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'savePdf.dart';

class ProPdfApi {
  static ProFicheController controller = Get.find();
  static var dateFormat = DateFormat.yMMMMd('fr');

  static Future<void> generatePdf(List<InfoPro> info) async {
    final _pdf = Document();
    final image = (await rootBundle.load("assets/icons/Logo GF (3).png"))
        .buffer
        .asUint8List();
    _pdf.addPage(
      MultiPage(
        /*pageFormat: PdfPageFormat(
            29.7 * PdfPageFormat.inch, 18.0 * PdfPageFormat.inch,
            marginAll: 1.2 * PdfPageFormat.cm),*/
        pageFormat: PdfPageFormat.a4,
        build: (_) => [
          buildTitle(image),
          SizedBox(height: 20),
          buildTable1(controller.listInfoProv),
          SizedBox(height: 20),
          buildTable2(controller.listInfoProd),
        ],
        header: (_) => buildHead(),
        footer: (_) => buildFoot(_, image),
      ),
    );

    await SavePdf.saveDoc("Fiche du Stock Matière Première.pdf", _pdf);
  }

  static Widget buildTable1(List<Prov> info) {
    final headers = [
      "Provendes",
      "Stock\ninitial",
      "Appro",
      "Consom",
      "Stock\nfinal",
    ];
    final data = info.map((e) {
      return [
        "${e.nom} (${e.unite})",
        "${e.iniQte}",
        "${e.approQte}",
        "${e.consQte}",
        "${e.finQte}",
      ];
    }).toList();
    /* Map<int, TableColumnWidth>? columnWidth() => {
          0: FixedColumnWidth(30),
          2: FixedColumnWidth(40),
          3: FixedColumnWidth(40),
          4: FixedColumnWidth(40),
          5: FixedColumnWidth(40),
        };*/
    return Table.fromTextArray(
      headers: headers,
      headerStyle:
          TextStyle(fontWeight: FontWeight.bold, color: PdfColors.white),
      cellStyle: TextStyle(fontSize: 10),
      headerDecoration: BoxDecoration(
        color: PdfColor.fromHex("006A34"),
      ),
      data: data,
      /*columnWidths: columnWidth(),*/
      cellAlignment: Alignment.centerLeft,
    );
  }

  static Widget buildTable2(List<Prod> info) {
    final headers = [
      "Produits de\ntraitement",
      "Stock\ninitial",
      "Appro",
      "Consom",
      "Stock\nfinal",
    ];
    final data = info.map((e) {
      return [
        "${e.nom} (${e.unite})",
        "${e.iniQte}",
        "${e.approQte}",
        "${e.consQte}",
        "${e.finQte}",
      ];
    }).toList();
    /* Map<int, TableColumnWidth>? columnWidth() => {
          0: FixedColumnWidth(30),
          2: FixedColumnWidth(40),
          3: FixedColumnWidth(40),
          4: FixedColumnWidth(40),
          5: FixedColumnWidth(40),
        };*/
    return Table.fromTextArray(
      headers: headers,
      headerStyle:
          TextStyle(fontWeight: FontWeight.bold, color: PdfColors.white),
      cellStyle: TextStyle(fontSize: 10),
      headerDecoration: BoxDecoration(
        color: PdfColor.fromHex("006A34"),
      ),
      data: data,
      /*columnWidths: columnWidth(),*/
      cellAlignment: Alignment.centerLeft,
    );
  }

  static Widget buildTitle(var image) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Le ${dateFormat.format(DateTime.now())}"),
                  SizedBox(height: 10),
                  Text("Période", style: TextStyle(fontSize: 16)),
                  Text(
                      "Du ${dateFormat.format(controller.startDate)} au ${dateFormat.format(controller.endDate)}",
                      style: TextStyle(fontSize: 12)),
                ],
              ),
              Image(MemoryImage(image), width: 55),
            ],
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

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
          Text("Fiche de Stock Matières Premières",
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: PdfColors.grey)),
        ],
      );
}
