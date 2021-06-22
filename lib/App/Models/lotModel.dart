class Lot {
  int? num;
  int? nmbrVolauillles;
  int? age;
  String? createAt;
  int? type;
  int? montant;
  bool select;
  Lot(this.num, this.nmbrVolauillles, this.age, this.createAt, this.type,
      this.montant, this.select);
}

List<Lot> lots = [
  Lot(1, 120, 88, "12/02/2020", 0, 0, false),
  Lot(2, 130, 100, "11/03/2020", 0, 0, false),
  Lot(3, 1210, 177, "12/04/2020", 1, 30000, false),
  Lot(4, 1250, 118, "12/04/2020", 1, 45000, false),
  Lot(5, 160, 184, "12/04/2020", 0, 0, false),
  Lot(6, 170, 108, "15/04/2020", 0, 0, false),
  Lot(7, 190, 58, "17/04/2020", 0, 0, false),
  Lot(8, 520, 10, "19/04/2020", 1, 18000, false),
  Lot(9, 820, 28, "20/04/2020", 0, 0, false),
  Lot(10, 320, 60, "12/06/2020", 0, 0, false),
  Lot(11, 720, 20, "15/06/2020", 1, 9800, false),
  Lot(12, 920, 18, "17/06/2020", 0, 0, false),
];
