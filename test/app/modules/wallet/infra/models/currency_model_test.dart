import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/currency.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/models/currency_model.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/models/detail_model.dart';

void main() {
  final file = File('test/app/currency.json').readAsStringSync();

  final detailModel = DetailModel(about: 'Teste', fee: 1.001);

  final success = CurrencyModel(
      currencyName: 'Nome',
      cotation: '100.000',
      symbol: 'ABC',
      imageUrl: 'https:teste.png',
      detail: detailModel);

  test('Deve retornar um CurrencyModel a partir do JSON', () async {
    final result = CurrencyModel.fromJson(file);
    expect(result, isA<Currency>());
    expect(result, equals(success));
  });
}
