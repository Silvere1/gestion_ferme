class PerteOeufs {
  int num;
  int petits;
  int moyens;
  int grands;
  String motif;
  DateTime dateTime;
  PerteOeufs(this.num, this.petits, this.moyens, this.grands, this.motif,
      this.dateTime);
}

List<PerteOeufs> mespertesoeufs = [
  PerteOeufs(0, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(1, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(2, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(3, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(4, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(5, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(6, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
  PerteOeufs(7, 12, 0, 8, "pourris", DateTime(2021, 3, 9)),
];
