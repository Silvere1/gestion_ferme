class VenteVolailles {
  int num;
  int qte;
  double montant;
  DateTime dateTime;
  VenteVolailles(this.num, this.qte, this.montant, this.dateTime);
}

List<VenteVolailles> mesventevolaille = [
  VenteVolailles(0, 16, 30000, DateTime(2021, 2, 21)),
  VenteVolailles(1, 34, 6732, DateTime(2021, 4, 23)),
  VenteVolailles(2, 12, 45332, DateTime(2021, 1, 9)),
  VenteVolailles(3, 56, 8965, DateTime(2021, 8, 8)),
  VenteVolailles(4, 77, 2334, DateTime(2021, 9, 5)),
  VenteVolailles(5, 16, 12234, DateTime(2021, 3, 9)),
  VenteVolailles(6, 98, 2345, DateTime(2021, 2, 5)),
  VenteVolailles(7, 88, 65432, DateTime(2021, 8, 12)),
  VenteVolailles(8, 97, 4356, DateTime(2021, 9, 3)),
];
