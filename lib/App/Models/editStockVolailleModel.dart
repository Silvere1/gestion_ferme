import 'lotModel.dart';

class EditStockVolailles {
  int num;
  Lot lot;
  int qte;
  bool isadd;
  DateTime dateTime;
  EditStockVolailles(this.num, this.lot, this.qte, this.isadd, this.dateTime);
}

List<EditStockVolailles> editstockvolailles = [
  EditStockVolailles(1, lots[0], 3, false, DateTime(2021, 2, 12)),
  EditStockVolailles(1, lots[0], 3, false, DateTime(2021, 2, 12)),
  EditStockVolailles(1, lots[0], 3, true, DateTime(2021, 2, 12)),
  EditStockVolailles(1, lots[0], 3, false, DateTime(2021, 2, 12)),
  EditStockVolailles(1, lots[0], 3, true, DateTime(2021, 2, 12)),
];
