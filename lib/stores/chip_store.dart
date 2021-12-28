import 'package:mobx/mobx.dart';
import 'package:nagasone/data/datasources/nagasone_api.dart';
import 'package:nagasone/data/models/chip_model.dart';

part 'chip_store.g.dart';

class ChipStore = ChipStoreBase with _$ChipStore;

abstract class ChipStoreBase with Store {
  final NagasoneAPI _api = NagasoneAPI();

  @observable
  bool isSwitched = false;

  @observable
  ObservableList<ChipModel> listOfChips = ObservableList<ChipModel>();

  @observable
  bool tempIsSwitched = false;

  @observable
  int chipsNumber = 0;

  @observable
  int tempChipsNumber = 0;

  @action
  void changeChips(int chipsCount) {
    chipsNumber = chipsCount;
  }

  @action
  void chipsIncrement() {
    chipsNumber += 1;
  }

  @action
  void chipsTempIncrement() {
    tempChipsNumber += 1;
  }

  @action
  void chipsTempDecrement() {
    tempChipsNumber -= 1;
  }

  @action
  void chipsDecrement() {
    chipsNumber -= 1;
  }

  @action
  void clear() {
    chipsNumber = 0;
    isSwitched = false;
  }

  @action
  void switcher(bool newValue) {
    isSwitched = newValue;
  }

  @action
  Future<void> downloadReportChips() async {
    _api.downloadChipsReport();
  }

  @action
  void tempSwitcher(bool newValue) {
    tempIsSwitched = newValue;
  }

  @action
  void setTempValues(bool isSwitched, int chipNumber) {
    tempIsSwitched = isSwitched;
    tempChipsNumber = chipNumber;
  }

  @action
  void changeTempChipsValue(int newValue) {
    tempChipsNumber = newValue;
  }

  @action
  Future<void> changeChipTransation(String uuid, int index) async {
    var chipTransaction = await _api.changeChipTransaction(
        uuid: uuid,
        chipCount: tempChipsNumber,
        transactionType: tempIsSwitched == true ? 'cashless' : 'cash');
    listOfChips[index] = chipTransaction;
  }

  @action
  Future<void> createChipTransation() async {
    var chipTransaction = await _api.createChipTransaction(
        chipCount: chipsNumber,
        transactionType: isSwitched == true ? 'cashless' : 'cash');
    listOfChips.add(chipTransaction);
  }

  @action
  Future<List<ChipModel>> getChipsTransactions() async {
    listOfChips.clear();
    listOfChips.addAll(await _api.getChipsTransactions());
    return listOfChips;
  }

  @action
  Future<void> deleteTransaction(String uuid, int index) async {
    await _api.deleteChipTransaction(uuid);
    listOfChips.removeAt(index);
  }
}
