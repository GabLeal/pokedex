import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/failure/pokemon_not_found_failure.dart';
import 'package:pokedex/core/network/http_response.dart';
import 'package:pokedex/core/util/base_url.dart';
import 'package:pokedex/layers/data/datasources/remote/moves/move_datasource_imp.dart';
import 'package:pokedex/layers/domain/entities/move_details_entity.dart';

import '../../../../../util/http_client_mock.dart';

main() {
  final httpClientMock = HttpClientMock();

  final datasource = MoveDetailsDatasourceImp(httpClientMock);

  test('should return a NotFoundFailure when statusCode different from 200',
      () async {
    when(
      () => httpClientMock.get(
        any(),
      ),
    ).thenAnswer(
      (_) async => HttpResponse(url: 'any', body: json, statusCode: 404),
    );

    var result = await datasource.getMoveDetails('any');

    expect(result.isLeft, true);
    expect(result.left, isA<NotFoundFailure>());
  });
  test('should return a DatasourceFailure when given an exeption', () async {
    when(
      () => httpClientMock.get(
        any(),
      ),
    ).thenThrow(
      Exception(),
    );

    var result = await datasource.getMoveDetails('any');

    expect(result.isLeft, true);
    expect(result.left, isA<DatasourceFailure>());
  });

  test('should return MoveDetails', () async {
    when(() => httpClientMock.get(any())).thenAnswer(
      (_) async => HttpResponse(
        url: BaseUrl.url,
        body: jsonMove,
        statusCode: 200,
      ),
    );

    var result = await datasource.getMoveDetails('any');

    expect(result.isRight, true);
    expect(result.right, isA<MoveDetailsEntity>());
  });
}

var jsonMove = {
  'accuracy': 100,
  'pp': 10,
  'power': 80,
  'name': 'razor-wind',
  'priority': 0,
  'type': {'name': 'normal', 'url': ' www.com.br'},
  'damage': {'name': 'normal', 'url': ' www.com.br'}
};
