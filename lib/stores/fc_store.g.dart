// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fc_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FCStore on FCStoreBase, Store {
  final _$valAtom = Atom(name: 'FCStoreBase.val');

  @override
  int get val {
    _$valAtom.reportRead();
    return super.val;
  }

  @override
  set val(int value) {
    _$valAtom.reportWrite(value, super.val, () {
      super.val = value;
    });
  }

  final _$listOfFCAtom = Atom(name: 'FCStoreBase.listOfFC');

  @override
  ObservableList<FCModel> get listOfFC {
    _$listOfFCAtom.reportRead();
    return super.listOfFC;
  }

  @override
  set listOfFC(ObservableList<FCModel> value) {
    _$listOfFCAtom.reportWrite(value, super.listOfFC, () {
      super.listOfFC = value;
    });
  }

  final _$isSwitchedAtom = Atom(name: 'FCStoreBase.isSwitched');

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

  final _$tempIsSWitcherAtom = Atom(name: 'FCStoreBase.tempIsSWitcher');

  @override
  bool get tempIsSWitcher {
    _$tempIsSWitcherAtom.reportRead();
    return super.tempIsSWitcher;
  }

  @override
  set tempIsSWitcher(bool value) {
    _$tempIsSWitcherAtom.reportWrite(value, super.tempIsSWitcher, () {
      super.tempIsSWitcher = value;
    });
  }

  final _$tempValAtom = Atom(name: 'FCStoreBase.tempVal');

  @override
  int get tempVal {
    _$tempValAtom.reportRead();
    return super.tempVal;
  }

  @override
  set tempVal(int value) {
    _$tempValAtom.reportWrite(value, super.tempVal, () {
      super.tempVal = value;
    });
  }

  final _$changeFCTransactionAsyncAction =
      AsyncAction('FCStoreBase.changeFCTransaction');

  @override
  Future<void> changeFCTransaction(int index, String uuid) {
    return _$changeFCTransactionAsyncAction
        .run(() => super.changeFCTransaction(index, uuid));
  }

  final _$createFCTransationAsyncAction =
      AsyncAction('FCStoreBase.createFCTransation');

  @override
  Future<void> createFCTransation() {
    return _$createFCTransationAsyncAction
        .run(() => super.createFCTransation());
  }

  final _$getFCTransactionsAsyncAction =
      AsyncAction('FCStoreBase.getFCTransactions');

  @override
  Future<List<FCModel>> getFCTransactions() {
    return _$getFCTransactionsAsyncAction.run(() => super.getFCTransactions());
  }

  final _$deleteTransactionAsyncAction =
      AsyncAction('FCStoreBase.deleteTransaction');

  @override
  Future<void> deleteTransaction(String uuid, int index) {
    return _$deleteTransactionAsyncAction
        .run(() => super.deleteTransaction(uuid, index));
  }

  final _$FCStoreBaseActionController = ActionController(name: 'FCStoreBase');

  @override
  void setTempValues(bool isSwitched, int val) {
    final _$actionInfo = _$FCStoreBaseActionController.startAction(
        name: 'FCStoreBase.setTempValues');
    try {
      return super.setTempValues(isSwitched, val);
    } finally {
      _$FCStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tempSwitcher(bool newValue) {
    final _$actionInfo = _$FCStoreBaseActionController.startAction(
        name: 'FCStoreBase.tempSwitcher');
    try {
      return super.tempSwitcher(newValue);
    } finally {
      _$FCStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$FCStoreBaseActionController.startAction(name: 'FCStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$FCStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switcher(bool newValue) {
    final _$actionInfo =
        _$FCStoreBaseActionController.startAction(name: 'FCStoreBase.switcher');
    try {
      return super.switcher(newValue);
    } finally {
      _$FCStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
val: ${val},
listOfFC: ${listOfFC},
isSwitched: ${isSwitched},
tempIsSWitcher: ${tempIsSWitcher},
tempVal: ${tempVal}
    ''';
  }
}
