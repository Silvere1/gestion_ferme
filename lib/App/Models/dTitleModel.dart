class DrTitle {
  late bool selected;
  late List<SubTitle> subtitle;
  DrTitle(this.selected, this.subtitle);
}

class SubTitle {
  late bool selected;
  SubTitle(this.selected);
}

List<DrTitle> titres = [
  DrTitle(true, [SubTitle(true)]),
  /*DrTitle(true, [
    SubTitle(false),
    SubTitle(false),
  ]),*/
  DrTitle(false, [
    SubTitle(false),
    SubTitle(false),
    SubTitle(false),
    SubTitle(false),
    /*SubTitle(false),*/
  ]),
  DrTitle(true, [
    SubTitle(false),
  ]),
  DrTitle(false, [
    SubTitle(false),
    SubTitle(false),
  ]),
  DrTitle(true, [
    SubTitle(false),
  ]),
  DrTitle(true, [
    SubTitle(false),
  ]),
];
