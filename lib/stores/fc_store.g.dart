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
isSwitched: ${isSwitched}
    ''';
  }
}
