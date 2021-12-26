import 'package:mobx/mobx.dart';
import 'package:nagasone/data/datasources/nagasone_api.dart';
import 'package:nagasone/data/models/fc_model.dart';

part 'fc_store.g.dart';

class FCStore = FCStoreBase with _$FCStore;

abstract class FCStoreBase with Store {
  final NagasoneAPI _api = NagasoneAPI();

  @observable
  int val = -1;

  @observable
  ObservableList<FCModel> listOfFC = ObservableList<FCModel>();

  @observable
  bool isSwitched = false;

  @action
  void clear() {
    val = -1;
    isSwitched = false;
  }

  @action
  void switcher(bool newValue) {
    isSwitched = newValue;
  }

  @action
  Future<void> createFCTransation() async {
    var fCTransaction = await _api.createFCTransaction(
        amount: calculateAmount(),
        transactionType: isSwitched == true ? 'cashless' : 'cash');
    listOfFC.add(fCTransaction);
  }

  @action
  Future<List<FCModel>> getFCTransactions() async {
    listOfFC.clear();
    listOfFC.addAll(await _api.getFCTransactions());
    return listOfFC;
  }

  int calculateAmount() {
    if (val == 1) {
      return 0;
    } else if (val == 2) {
      return 400;
    } else if (val == 3) {
      return 900;
    } else {
      return 1500;
    }
  }
}
