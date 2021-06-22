import 'lotModel.dart';

class CollecteOeuf {
  Lot lot;
  int petits;
  int moyens;
  int grands;
  int feles;
  DateTime dateTime;
  int num;
  CollecteOeuf(this.lot, this.petits, this.moyens, this.grands, this.feles,
      this.dateTime, this.num);
}

List<CollecteOeuf> collectoeuf = [
  CollecteOeuf(lots[2], 200, 90, 80, 7, DateTime(2021, 2, 4), 0),
  CollecteOeuf(lots[0], 10, 13, 8, 0, DateTime(2021, 12, 15), 1),
  CollecteOeuf(lots[3], 130, 13, 8, 8, DateTime(2021, 12, 15), 2),
  CollecteOeuf(lots[7], 150, 0, 8, 0, DateTime(2021, 12, 15), 3),
  CollecteOeuf(lots[1], 4, 13, 8, 2, DateTime(2021, 12, 15), 4),
  CollecteOeuf(lots[2], 10, 0, 8, 0, DateTime(2021, 12, 15), 5),
  CollecteOeuf(lots[6], 11, 13, 5, 9, DateTime(2021, 12, 15), 6),
];
