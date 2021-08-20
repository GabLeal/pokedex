// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonStore on _PokemonStoreBase, Store {
  final _$statusRequestAtom = Atom(name: '_PokemonStoreBase.statusRequest');

  @override
  StatusRequest get statusRequest {
    _$statusRequestAtom.reportRead();
    return super.statusRequest;
  }

  @override
  set statusRequest(StatusRequest value) {
    _$statusRequestAtom.reportWrite(value, super.statusRequest, () {
      super.statusRequest = value;
    });
  }

  @override
  String toString() {
    return '''
statusRequest: ${statusRequest}
    ''';
  }
}
