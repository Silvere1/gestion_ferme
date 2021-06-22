import 'lotModel.dart';
import 'provendeModel.dart';

class ConsomProvende {
  int num;
  Lot lot;
  Provende provende;
  int qte;
  DateTime dateTime;
  ConsomProvende(this.num, this.lot, this.provende, this.qte, this.dateTime);
}

List<ConsomProvende> consomprovende = [
  ConsomProvende(1, lots[3], provendes[2], 2, DateTime(2021, 2, 17)),
  ConsomProvende(1, lots[3], provendes[2], 2, DateTime(2021, 2, 17)),
  ConsomProvende(1, lots[3], provendes[2], 2, DateTime(2021, 2, 17)),
  ConsomProvende(1, lots[3], provendes[2], 2, DateTime(2021, 2, 17)),
  ConsomProvende(1, lots[3], provendes[2], 2, DateTime(2021, 2, 17)),
];
