import 'package:mobx/mobx.dart';

part 'fc_store.g.dart';

class FCStore = FCStoreBase with _$FCStore;

abstract class FCStoreBase with Store {
  @observable
  bool isSwitched = false;

  @observable
  double sliderValue = 0;

  @action
  void switcher(bool newValue) {
    isSwitched = newValue;
  }

  @action
  void changeSliderValue(double newValue) {
    sliderValue = newValue;
  }
}
