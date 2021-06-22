import 'lotModel.dart';

class ConsomEau {
  int num;
  int qte;
  Lot lot;
  DateTime dateTime;
  ConsomEau(this.num, this.qte, this.lot, this.dateTime);
}

List<ConsomEau> consomeau = [
  ConsomEau(1, 2, lots[3], DateTime(2021, 3, 4)),
  ConsomEau(1, 2, lots[3], DateTime(2021, 3, 4)),
  ConsomEau(1, 2, lots[3], DateTime(2021, 3, 4)),
  ConsomEau(1, 2, lots[3], DateTime(2021, 3, 4)),
  ConsomEau(1, 2, lots[3], DateTime(2021, 3, 4)),
];
