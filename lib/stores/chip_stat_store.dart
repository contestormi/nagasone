import 'package:mobx/mobx.dart';
import 'package:nagasone/data/datasources/nagasone_api.dart';
import 'package:nagasone/data/models/chip_stat_model.dart';
part 'chip_stat_store.g.dart';

class ChipStatStore = _ChipStatStoreBase with _$ChipStatStore;

abstract class _ChipStatStoreBase with Store {
  @action
  Future<ChipStatModel> future() async{
    return NagasoneAPI().getChipStatTransactions();
  }
}