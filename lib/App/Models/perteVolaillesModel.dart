import 'lotModel.dart';

class PerteVolailles {
  int num;
  Lot lot;
  int qte;
  String motif;
  DateTime dateTime;
  PerteVolailles(this.num, this.lot, this.qte, this.motif, this.dateTime);
}

List<PerteVolailles> mespertevolailles = [
  PerteVolailles(0, lots[0], 3, "Volées", DateTime(2021, 2, 18)),
  PerteVolailles(1, lots[0], 12, "malade", DateTime(2021, 2, 18)),
  PerteVolailles(2, lots[0], 5, "malade", DateTime(2021, 2, 18)),
  PerteVolailles(3, lots[0], 35, "Volées", DateTime(2021, 2, 18)),
  PerteVolailles(4, lots[0], 0, "malade", DateTime(2021, 2, 18)),
  PerteVolailles(5, lots[0], 12, "gripe", DateTime(2021, 2, 18)),
  PerteVolailles(6, lots[0], 3, "Volées", DateTime(2021, 2, 18)),
  PerteVolailles(7, lots[0], 9, "je ne sais pas", DateTime(2021, 2, 18)),
];
