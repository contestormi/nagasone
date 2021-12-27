import 'package:mobx/mobx.dart';
import 'package:nagasone/data/datasources/nagasone_api.dart';
import 'package:nagasone/data/models/fc_stat_model.dart';
part 'fc_stat_store.g.dart';

class FCStatStore = _FCStatStoreBase with _$FCStatStore;

abstract class _FCStatStoreBase with Store {
    @action
  Future<FCStatModel> future() async{
    return NagasoneAPI().getFCStatTransactions();
  }
  
}