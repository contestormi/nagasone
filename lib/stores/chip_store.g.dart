// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chip_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChipStore on ChipStoreBase, Store {
  final _$isSwitchedAtom = Atom(name: 'ChipStoreBase.isSwitched');

  @override
  bool get isSwitched {
    _$isSwitchedAtom.reportRead();
    return super.isSwitched;
  }

  @override
  set isSwitched(bool value) {
    _$isSwitchedAtom.reportWrite(value, super.isSwitched, () {
      super.isSwitched = value;
    });
  }

  final _$sliderValueAtom = Atom(name: 'ChipStoreBase.sliderValue');

  @override
  double get sliderValue {
    _$sliderValueAtom.reportRead();
    return super.sliderValue;
  }

  @override
  set sliderValue(double value) {
    _$sliderValueAtom.reportWrite(value, super.sliderValue, () {
      super.sliderValue = value;
    });
  }

  final _$listOfFCAtom = Atom(name: 'ChipStoreBase.listOfFC');

  @override
  ObservableList<ChipModel> get listOfFC {
    _$listOfFCAtom.reportRead();
    return super.listOfFC;
  }

  @override
  set listOfFC(ObservableList<ChipModel> value) {
    _$listOfFCAtom.reportWrite(value, super.listOfFC, () {
      super.listOfFC = value;
    });
  }

  final _$getChipsTransactionsAsyncAction =
      AsyncAction('ChipStoreBase.getChipsTransactions');

  @override
  Future<List<ChipModel>> getChipsTransactions() {
    return _$getChipsTransactionsAsyncAction
        .run(() => super.getChipsTransactions());
  }

  final _$ChipStoreBaseActionController =
      ActionController(name: 'ChipStoreBase');

  @override
  void switcher(bool newValue) {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.switcher');
    try {
      return super.switcher(newValue);
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSliderValue(double newValue) {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.changeSliderValue');
    try {
      return super.changeSliderValue(newValue);
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> createFCTransation() {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.createFCTransation');
    try {
      return super.createFCTransation();
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSwitched: ${isSwitched},
sliderValue: ${sliderValue},
listOfFC: ${listOfFC}
    ''';
  }
}
