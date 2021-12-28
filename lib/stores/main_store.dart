import 'package:mobx/mobx.dart';
import 'package:nagasone/data/datasources/nagasone_api.dart';
import 'package:nagasone/data/models/chip_stat_model.dart';
import 'package:nagasone/data/models/fc_stat_model.dart';
import 'package:nagasone/data/models/visitor_model.dart';
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

  @observable
  bool isSwitched = false;

  @action
  void setSwitcher(index) {
    isSwitched = !listOfVisitors[index].isPassed;
  }

  @action
  void switcher(bool newValue) {
    isSwitched = newValue;
  }

  @observable
  ObservableList<VisitorModel> listOfVisitors = ObservableList<VisitorModel>();

  @action
  Future<void> createDump() async {
    await _api.createDump();
  }

  @action
  Future<List<VisitorModel>> getVistirosList() async {
    listOfVisitors.clear();
    listOfVisitors.addAll(await _api.getVistirosList());
    return listOfVisitors;
  }

  @action
  Future<void> createVisitor(String fio) async {
    listOfVisitors.add(await _api.createVisitor(
      fio: fio,
    ));
  }

  @action
  Future<void> deleteVisitor(int index) async {
    _api.deleteVisitor(listOfVisitors[index].id);
    listOfVisitors.removeAt(index);
  }

  @action
  void clear() {
    isSwitched = false;
  }

  @action
  Future<ChipStatModel> getChipStatTransactions() async {
    return _api.getChipStatTransactions();
  }

  @action
  Future<FCStatModel> getFCStatTransactions() {
    return _api.getFCStatTransactions();
  }

  @action
  Future<void> changeVisitor(int index, String fio) async {
    listOfVisitors[index] = await _api.changeVisitor(
        id: listOfVisitors[index].id, fio: fio, isPassed: !isSwitched);
  }
}
