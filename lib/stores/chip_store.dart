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
  double sliderValue = 0;

  @observable
  ObservableList<ChipModel> listOfFC = ObservableList<ChipModel>();

  @action
  void switcher(bool newValue) {
    isSwitched = newValue;
  }

  @action
  void changeSliderValue(double newValue) {
    sliderValue = newValue;
  }

  @action
  Future<void> createFCTransation() {
    return _api.createChipTransaction(
        chipCount: sliderValue.toInt(),
        transactionType: isSwitched == true ? 'cashless' : 'cash');
  }

  @action
  Future<List<ChipModel>> getChipsTransactions() async {
    listOfFC.clear();
    print(listOfFC);
    listOfFC.addAll(await _api.getChipsTransactions());
    print(listOfFC);
    return listOfFC;
  }
}
