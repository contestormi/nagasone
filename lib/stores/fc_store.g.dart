// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fc_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FCStore on FCStoreBase, Store {
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

  final _$sliderValueAtom = Atom(name: 'FCStoreBase.sliderValue');

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

  final _$FCStoreBaseActionController = ActionController(name: 'FCStoreBase');

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
  void changeSliderValue(double newValue) {
    final _$actionInfo = _$FCStoreBaseActionController.startAction(
        name: 'FCStoreBase.changeSliderValue');
    try {
      return super.changeSliderValue(newValue);
    } finally {
      _$FCStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSwitched: ${isSwitched},
sliderValue: ${sliderValue}
    ''';
  }
}
