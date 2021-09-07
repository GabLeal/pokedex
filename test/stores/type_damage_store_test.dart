import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/model/type_damage.dart';
import 'package:pokedex/repository/type_damage_repository.dart';
import 'package:pokedex/stores/type_damage_store.dart';
import 'package:pokedex/util/enums.dart';

class TypeDamageRepositoryMock extends Mock implements TypeDamageRepository {}

main() {
  final repository = TypeDamageRepositoryMock();

  final store = TypeDamageStore(repository);
  test('should return one typeDamage', () async {
    when(() => repository.getTypeDamage(urlTest)).thenAnswer((_) async {
      store.typeDamage = TypeDamage();
      store.statusRequestTypedamage = StatusRequest.success;
    });

    store.getTypeDamage(urlTest);
    expect(store.typeDamage, isNotNull);
    expect(store.statusRequestTypedamage, StatusRequest.success);
  });

  test('typeDamage must be null', () {
    when(() => repository.getTypeDamage(urlTest)).thenAnswer((_) async {
      store.typeDamage = null;
      store.statusRequestTypedamage = StatusRequest.error;
    });

    store.getTypeDamage(urlTest);
    expect(store.typeDamage, isNull);
    expect(store.statusRequestTypedamage, StatusRequest.error);
  });
}

var urlTest = '';
