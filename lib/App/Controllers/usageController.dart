import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/usageOeufsModel.dart';
import 'package:gestionferme/App/Models/usageVolaillesModel.dart';
import 'package:get/get.dart';

class UsageController extends GetxController {
  var itemUsage = [].obs;
  var listUsageOeufs = <UsedOeufs>[].obs;
  var listUsageVolailles = <UsedVolailles>[].obs;

  @override
  void onReady() {
    super.onReady();
    readListUsageOeufs();
    readListUsageVolailles();
  }

  Future<List<UsedOeufs>> readListUsageOeufs() async {
    listUsageOeufs.value = myusageoeuf.reversed.toList();
    return listUsageOeufs;
  }

  Future<List<UsedVolailles>> readListUsageVolailles() async {
    listUsageVolailles.value = myusagevolaille.reversed.toList();
    return listUsageVolailles;
  }

  Future<void> getItem(Lot lot) async {
    itemUsage.value = [];
    itemUsage.add(lot);
  }
}
