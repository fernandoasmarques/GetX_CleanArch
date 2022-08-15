import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/errors/errors.dart';
import 'package:getx_cleanarch/app/modules/wallet/external/datasources/get_wallet_datasource_impl.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/models/wallet_model.dart';
import 'package:getx_cleanarch/app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  late MockHttpClient mockHttpClient;
  late GetWalletDatasourceImpl getWalletDatasourceImpl;

  setUpAll(() {
    registerFallbackValue(FakeUri());
    mockHttpClient = MockHttpClient();
    getWalletDatasourceImpl = GetWalletDatasourceImpl(mockHttpClient);
  });

  final file = File('test/app/criptomoedas.json').readAsStringSync();
  final tWalletModel = WalletModel.fromJson(file);

  test('Deve fazer uma requisição GET com text/plain header', () async {
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(file, 200));

    getWalletDatasourceImpl.getWallet();

    verify(() => mockHttpClient.get(
          Uri.parse(Utils.jsonSource),
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'text/plain; charset=utf-8'
          },
        ));
  });

  test('Deve retornar WalletModel quando a code response for 200 - success',
      () async {
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(file, 200));

    final result = await getWalletDatasourceImpl.getWallet();

    expect(result, equals(tWalletModel));
  });

  test('Deve lançar WalletException quando a code response for 404 ou outro',
      () async {
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response('Algo errado', 404));

    final result = getWalletDatasourceImpl.getWallet;

    expect(result, throwsA(isA<WalletException>()));
  });
}
