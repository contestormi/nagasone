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

  final _$listOfChipsAtom = Atom(name: 'ChipStoreBase.listOfChips');

  @override
  ObservableList<ChipModel> get listOfChips {
    _$listOfChipsAtom.reportRead();
    return super.listOfChips;
  }

  @override
  set listOfChips(ObservableList<ChipModel> value) {
    _$listOfChipsAtom.reportWrite(value, super.listOfChips, () {
      super.listOfChips = value;
    });
  }

  final _$tempIsSwitchedAtom = Atom(name: 'ChipStoreBase.tempIsSwitched');

  @override
  bool get tempIsSwitched {
    _$tempIsSwitchedAtom.reportRead();
    return super.tempIsSwitched;
  }

  @override
  set tempIsSwitched(bool value) {
    _$tempIsSwitchedAtom.reportWrite(value, super.tempIsSwitched, () {
      super.tempIsSwitched = value;
    });
  }

  final _$chipsNumberAtom = Atom(name: 'ChipStoreBase.chipsNumber');

  @override
  int get chipsNumber {
    _$chipsNumberAtom.reportRead();
    return super.chipsNumber;
  }

  @override
  set chipsNumber(int value) {
    _$chipsNumberAtom.reportWrite(value, super.chipsNumber, () {
      super.chipsNumber = value;
    });
  }

  final _$tempChipsNumberAtom = Atom(name: 'ChipStoreBase.tempChipsNumber');

  @override
  int get tempChipsNumber {
    _$tempChipsNumberAtom.reportRead();
    return super.tempChipsNumber;
  }

  @override
  set tempChipsNumber(int value) {
    _$tempChipsNumberAtom.reportWrite(value, super.tempChipsNumber, () {
      super.tempChipsNumber = value;
    });
  }

  final _$downloadReportChipsAsyncAction =
      AsyncAction('ChipStoreBase.downloadReportChips');

  @override
  Future<void> downloadReportChips() {
    return _$downloadReportChipsAsyncAction
        .run(() => super.downloadReportChips());
  }

  final _$changeChipTransationAsyncAction =
      AsyncAction('ChipStoreBase.changeChipTransation');

  @override
  Future<void> changeChipTransation(String uuid, int index) {
    return _$changeChipTransationAsyncAction
        .run(() => super.changeChipTransation(uuid, index));
  }

  final _$createChipTransationAsyncAction =
      AsyncAction('ChipStoreBase.createChipTransation');

  @override
  Future<void> createChipTransation() {
    return _$createChipTransationAsyncAction
        .run(() => super.createChipTransation());
  }

  final _$getChipsTransactionsAsyncAction =
      AsyncAction('ChipStoreBase.getChipsTransactions');

  @override
  Future<List<ChipModel>> getChipsTransactions() {
    return _$getChipsTransactionsAsyncAction
        .run(() => super.getChipsTransactions());
  }

  final _$deleteTransactionAsyncAction =
      AsyncAction('ChipStoreBase.deleteTransaction');

  @override
  Future<void> deleteTransaction(String uuid, int index) {
    return _$deleteTransactionAsyncAction
        .run(() => super.deleteTransaction(uuid, index));
  }

  final _$ChipStoreBaseActionController =
      ActionController(name: 'ChipStoreBase');

  @override
  void changeChips(int chipsCount) {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.changeChips');
    try {
      return super.changeChips(chipsCount);
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chipsIncrement() {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.chipsIncrement');
    try {
      return super.chipsIncrement();
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chipsTempIncrement() {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.chipsTempIncrement');
    try {
      return super.chipsTempIncrement();
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chipsTempDecrement() {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.chipsTempDecrement');
    try {
      return super.chipsTempDecrement();
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chipsDecrement() {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.chipsDecrement');
    try {
      return super.chipsDecrement();
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void tempSwitcher(bool newValue) {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.tempSwitcher');
    try {
      return super.tempSwitcher(newValue);
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTempValues(bool isSwitched, int chipNumber) {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.setTempValues');
    try {
      return super.setTempValues(isSwitched, chipNumber);
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTempChipsValue(int newValue) {
    final _$actionInfo = _$ChipStoreBaseActionController.startAction(
        name: 'ChipStoreBase.changeTempChipsValue');
    try {
      return super.changeTempChipsValue(newValue);
    } finally {
      _$ChipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSwitched: ${isSwitched},
listOfChips: ${listOfChips},
tempIsSwitched: ${tempIsSwitched},
chipsNumber: ${chipsNumber},
tempChipsNumber: ${tempChipsNumber}
    ''';
  }
}
