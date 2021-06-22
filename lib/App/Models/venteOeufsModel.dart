class VenteOeuf {
  int petits;
  int moyens;
  int grands;
  double montant;
  int num;
  DateTime dateTime;
  VenteOeuf(this.petits, this.moyens, this.grands, this.montant, this.num,
      this.dateTime);
}

List<VenteOeuf> mesventesoeufs = [
  VenteOeuf(10, 0, 50, 4000, 0, DateTime(2021, 1, 8)),
  VenteOeuf(0, 100, 80, 6000, 1, DateTime(2021, 2, 10)),
  VenteOeuf(10, 10, 5, 1200, 2, DateTime(2021, 11, 30)),
  VenteOeuf(120, 0, 60, 15000, 3, DateTime(2021, 9, 12)),
  VenteOeuf(10, 0, 50, 7000, 4, DateTime(2021, 7, 23)),
  VenteOeuf(101, 77, 50, 9000, 5, DateTime(2021, 4, 17)),
  VenteOeuf(130, 70, 50, 8000, 6, DateTime(2021, 3, 18)),
];
