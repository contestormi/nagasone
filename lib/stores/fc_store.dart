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

  @observable
  bool tempIsSWitcher = false;

  @observable
  int tempVal = -1;

  @action
  void setTempValues(bool isSwitched, int val) {
    tempIsSWitcher = isSwitched;
    if (val == 0) {
      tempVal = 1;
    } else if (val == 400) {
      tempVal = 2;
    } else if (val == 900) {
      tempVal = 3;
    } else if (val == 1500) {
      tempVal = 4;
    }
  }

  @action
  void tempSwitcher(bool newValue) {
    tempIsSWitcher = newValue;
  }

  @action
  Future<void> changeFCTransaction(int index, String uuid) async {
    var fCTransaction = await _api.changeFCTransaction(
        uuid: uuid,
        amount: calculateAmount(tempVal),
        transactionType: tempIsSWitcher == true ? 'cashless' : 'cash');
    print(fCTransaction.amount);
    print(fCTransaction.transactionType);

    listOfFC[index] = fCTransaction;
  }

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
        amount: calculateAmount(val),
        transactionType: isSwitched == true ? 'cashless' : 'cash');
    listOfFC.add(fCTransaction);
  }

  @action
  Future<List<FCModel>> getFCTransactions() async {
    listOfFC.clear();
    listOfFC.addAll(await _api.getFCTransactions());
    return listOfFC;
  }

  @action
  Future<void> deleteTransaction(String uuid, int index) async {
    await _api.deleteFCTransaction(uuid);
    listOfFC.removeAt(index);
  }

  int calculateAmount(int variable) {
    if (variable == 1) {
      return 0;
    } else if (variable == 2) {
      return 400;
    } else if (variable == 3) {
      return 900;
    } else {
      return 1500;
    }
  }
}
