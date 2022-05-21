import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/failure/datasource_failure.dart';
import 'package:pokedex/core/network/http_client.dart';
import 'package:pokedex/core/network/http_client_interface.dart';
import 'package:pokedex/core/network/http_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late IHttpClient httpClient;
  late DioMock dioMock;

  setUp(() {
    dioMock = DioMock();
    httpClient = HttpClient(dioMock);
  });

  const tURL = 'https://some-fake.url/';
  const tHeaders = {'Content-Type': 'application/json'};
  const tBody = {'key': 'value'};
  const tSuccessData = '{"message": "Success"}';
  const tSuccessResponse = HttpResponse(
    body: tSuccessData,
    statusCode: 200,
    url: tURL,
  );

  test('HttpClient deve respeitar a abstração IHttpClient', () {
    expect(httpClient, isA<IHttpClient>());
  });

  group('Método GET', () {
    test(
        'Deve realizar uma requisição com o método GET com os parâmetros corretos e retornar um HttpResponse',
        () async {
      when(() => dioMock.get(any(), options: any(named: 'options'))).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(
            path: tURL,
          ),
          data: tSuccessData,
          statusCode: 200,
        ),
      );

      final result = await httpClient.get(tURL, headers: tHeaders);

      expect(
        result,
        isA<HttpResponse>().having(
          (success) => success,
          'Possui a resposta correta',
          HttpResponse(
            body: tSuccessData,
            statusCode: 200,
            url: tURL,
          ),
        ),
      );
    });

    test('Deve lançar uma InternalServerFailure se ocorrer um erro inesperado',
        () async {
      when(() => dioMock.get(any(), options: any(named: 'options')))
          .thenThrow(Exception('Unexpected exception'));

      final call = httpClient.get;

      await expectLater(
        () => call(tURL, headers: tHeaders),
        throwsA(isA<InternalServerFailure>()),
      );
    });
  });

  group('Método POST', () {
    test(
        'Deve realizar uma requisição com o método POST com os parâmetros corretos e retornar um HttpResponse',
        () async {
      when(
        () => dioMock.post(
          any(),
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: tSuccessData,
          statusCode: 200,
          requestOptions: RequestOptions(
            path: tURL,
          ),
        ),
      );

      final result = await httpClient.post(
        tURL,
        headers: tHeaders,
        body: tBody,
      );

      expect(
        result,
        isA<HttpResponse>().having(
          (success) => success,
          'Possui a resposta correta',
          tSuccessResponse,
        ),
      );
    });

    test('Deve lançar uma InternalServerFailure se ocorrer um erro inesperado',
        () async {
      when(
        () => dioMock.post(
          tURL,
          options: Options(headers: tHeaders),
          data: tBody,
        ),
      ).thenThrow(
        Exception('Unexpected exception'),
      );

      final call = httpClient.post;

      await expectLater(
        () => call(tURL, headers: tHeaders, body: tBody),
        throwsA(isA<InternalServerFailure>()),
      );
    });
  });

  group('Método PUT', () {
    test(
        'Deve realizar uma requisição com o método PUT com os parâmetros corretos e retornar um HttpResponse',
        () async {
      when(
        () => dioMock.put(
          any(),
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: tSuccessData,
          statusCode: 200,
          requestOptions: RequestOptions(
            path: tURL,
          ),
        ),
      );

      final result = await httpClient.put(tURL, headers: tHeaders, body: tBody);

      expect(
        result,
        isA<HttpResponse>().having(
          (success) => success,
          'Possui a resposta correta',
          tSuccessResponse,
        ),
      );
    });

    test('Deve lançar uma InternalServerFailure se ocorrer um erro inesperado',
        () async {
      when(
        () => dioMock.put(
          tURL,
          options: Options(headers: tHeaders),
          data: tBody,
        ),
      ).thenThrow(Exception('Unexpected exception'));

      final call = httpClient.put;

      await expectLater(
        () => call(tURL, headers: tHeaders, body: tBody),
        throwsA(isA<InternalServerFailure>()),
      );
    });
  });

  group('Método PATCH', () {
    test(
        'Deve realizar uma requisição com o método PATCH com os parâmetros corretos e retornar um HttpResponse',
        () async {
      when(
        () => dioMock.patch(
          any(),
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: tSuccessData,
          statusCode: 200,
          requestOptions: RequestOptions(
            path: tURL,
          ),
        ),
      );

      final result =
          await httpClient.patch(tURL, headers: tHeaders, body: tBody);

      expect(
        result,
        isA<HttpResponse>().having(
          (success) => success,
          'Possui a resposta correta',
          tSuccessResponse,
        ),
      );
    });

    test('Deve lançar uma InternalServerFailure se ocorrer um erro inesperado',
        () async {
      when(
        () => dioMock.patch(
          tURL,
          options: Options(headers: tHeaders),
          data: tBody,
        ),
      ).thenThrow(Exception('Unexpected exception'));

      final call = httpClient.patch;

      await expectLater(
        () => call(tURL, headers: tHeaders, body: tBody),
        throwsA(isA<InternalServerFailure>()),
      );
    });
  });

  group('Método DELETE', () {
    test(
        'Deve realizar uma requisição com o método DELETE com os parâmetros corretos e retornar um HttpResponse',
        () async {
      when(
        () => dioMock.delete(
          any(),
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: tSuccessData,
          statusCode: 200,
          requestOptions: RequestOptions(
            path: tURL,
          ),
        ),
      );

      final result =
          await httpClient.delete(tURL, headers: tHeaders, body: tBody);

      expect(
        result,
        isA<HttpResponse>().having(
          (success) => success,
          'Possui a resposta correta',
          tSuccessResponse,
        ),
      );
    });

    test('Deve lançar uma InternalServerFailure se ocorrer um erro inesperado',
        () async {
      when(
        () => dioMock.delete(
          tURL,
          options: Options(headers: tHeaders),
          data: tBody,
        ),
      ).thenThrow(Exception('Unexpected exception'));

      final call = httpClient.delete;

      await expectLater(
        () => call(tURL, headers: tHeaders, body: tBody),
        throwsA(isA<InternalServerFailure>()),
      );
    });
  });
}
