// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AbilityStore on _AbilityStoreBase, Store {
  final _$statusRequestAbilityAtom =
      Atom(name: '_AbilityStoreBase.statusRequestAbility');

  @override
  StatusRequest get statusRequestAbility {
    _$statusRequestAbilityAtom.reportRead();
    return super.statusRequestAbility;
  }

  @override
  set statusRequestAbility(StatusRequest value) {
    _$statusRequestAbilityAtom.reportWrite(value, super.statusRequestAbility,
        () {
      super.statusRequestAbility = value;
    });
  }

  @override
  String toString() {
    return '''
statusRequestAbility: ${statusRequestAbility}
    ''';
  }
}
