// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoveStore on _MoveStoreBase, Store {
  final _$statusRequestMoveAtom =
      Atom(name: '_MoveStoreBase.statusRequestMove');

  @override
  StatusRequest get statusRequestMove {
    _$statusRequestMoveAtom.reportRead();
    return super.statusRequestMove;
  }

  @override
  set statusRequestMove(StatusRequest value) {
    _$statusRequestMoveAtom.reportWrite(value, super.statusRequestMove, () {
      super.statusRequestMove = value;
    });
  }

  @override
  String toString() {
    return '''
statusRequestMove: ${statusRequestMove}
    ''';
  }
}
