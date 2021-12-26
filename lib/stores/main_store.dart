import 'package:mobx/mobx.dart';
import 'package:nagasone/data/datasources/nagasone_api.dart';
import 'package:nagasone/main.dart';
import 'package:nagasone/stores/chip_store.dart';
import 'package:nagasone/stores/fc_store.dart';

part 'main_store.g.dart';

class MainStore = MainStoreBase with _$MainStore;

abstract class MainStoreBase with Store {
  final NagasoneAPI _api = NagasoneAPI();

  @action
  Future<void> rebuildDB() async {
    if (await _api.rebuildDB()) {
      getIt<ChipStore>().listOfChips.clear();
      getIt<FCStore>().listOfFC.clear();
    }
  }
}
