// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_damage_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TypeDamageStore on _TypeDamageStoreBase, Store {
  final _$statusRequestTypedamageAtom =
      Atom(name: '_TypeDamageStoreBase.statusRequestTypedamage');

  @override
  StatusRequest get statusRequestTypedamage {
    _$statusRequestTypedamageAtom.reportRead();
    return super.statusRequestTypedamage;
  }

  @override
  set statusRequestTypedamage(StatusRequest value) {
    _$statusRequestTypedamageAtom
        .reportWrite(value, super.statusRequestTypedamage, () {
      super.statusRequestTypedamage = value;
    });
  }

  @override
  String toString() {
    return '''
statusRequestTypedamage: ${statusRequestTypedamage}
    ''';
  }
}
