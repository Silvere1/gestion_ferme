class EditStockOeuf {
  int num;
  bool isadd;
  int petits;
  int moyens;
  int grands;
  DateTime dateTime;
  EditStockOeuf(this.num, this.isadd, this.petits, this.moyens, this.grands,
      this.dateTime);
}

List<EditStockOeuf> editstockoeuf = [
  EditStockOeuf(1, true, 2, 5, 0, DateTime(2021, 2, 12)),
  EditStockOeuf(1, false, 2, 5, 0, DateTime(2021, 2, 12)),
  EditStockOeuf(1, true, 2, 5, 0, DateTime(2021, 2, 12)),
  EditStockOeuf(1, false, 2, 5, 0, DateTime(2021, 2, 12)),
  EditStockOeuf(1, true, 2, 5, 0, DateTime(2021, 2, 12)),
];
