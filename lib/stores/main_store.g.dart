// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on MainStoreBase, Store {
  final _$isSwitchedAtom = Atom(name: 'MainStoreBase.isSwitched');

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

  final _$listOfVisitorsAtom = Atom(name: 'MainStoreBase.listOfVisitors');

  @override
  ObservableList<VisitorModel> get listOfVisitors {
    _$listOfVisitorsAtom.reportRead();
    return super.listOfVisitors;
  }

  @override
  set listOfVisitors(ObservableList<VisitorModel> value) {
    _$listOfVisitorsAtom.reportWrite(value, super.listOfVisitors, () {
      super.listOfVisitors = value;
    });
  }

  final _$rebuildDBAsyncAction = AsyncAction('MainStoreBase.rebuildDB');

  @override
  Future<void> rebuildDB() {
    return _$rebuildDBAsyncAction.run(() => super.rebuildDB());
  }

  final _$createDumpAsyncAction = AsyncAction('MainStoreBase.createDump');

  @override
  Future<void> createDump() {
    return _$createDumpAsyncAction.run(() => super.createDump());
  }

  final _$getVistirosListAsyncAction =
      AsyncAction('MainStoreBase.getVistirosList');

  @override
  Future<List<VisitorModel>> getVistirosList() {
    return _$getVistirosListAsyncAction.run(() => super.getVistirosList());
  }

  final _$createVisitorAsyncAction = AsyncAction('MainStoreBase.createVisitor');

  @override
  Future<void> createVisitor(String fio) {
    return _$createVisitorAsyncAction.run(() => super.createVisitor(fio));
  }

  final _$deleteVisitorAsyncAction = AsyncAction('MainStoreBase.deleteVisitor');

  @override
  Future<void> deleteVisitor(int index) {
    return _$deleteVisitorAsyncAction.run(() => super.deleteVisitor(index));
  }

  final _$getChipStatTransactionsAsyncAction =
      AsyncAction('MainStoreBase.getChipStatTransactions');

  @override
  Future<ChipStatModel> getChipStatTransactions() {
    return _$getChipStatTransactionsAsyncAction
        .run(() => super.getChipStatTransactions());
  }

  final _$changeVisitorAsyncAction = AsyncAction('MainStoreBase.changeVisitor');

  @override
  Future<void> changeVisitor(int index, String fio) {
    return _$changeVisitorAsyncAction
        .run(() => super.changeVisitor(index, fio));
  }

  final _$MainStoreBaseActionController =
      ActionController(name: 'MainStoreBase');

  @override
  void switcher(bool newValue) {
    final _$actionInfo = _$MainStoreBaseActionController.startAction(
        name: 'MainStoreBase.switcher');
    try {
      return super.switcher(newValue);
    } finally {
      _$MainStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$MainStoreBaseActionController.startAction(
        name: 'MainStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$MainStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<FCStatModel> getFCStatTransactions() {
    final _$actionInfo = _$MainStoreBaseActionController.startAction(
        name: 'MainStoreBase.getFCStatTransactions');
    try {
      return super.getFCStatTransactions();
    } finally {
      _$MainStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSwitched: ${isSwitched},
listOfVisitors: ${listOfVisitors}
    ''';
  }
}
