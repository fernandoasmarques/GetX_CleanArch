import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/detail.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/models/detail_model.dart';

void main() {
  final file = File('test/app/detail.json').readAsStringSync();

  final success = DetailModel(about: 'Teste', fee: 1.001);

  test('Deve retornar um DetailModel a partir do JSON', () async {
    final result = DetailModel.fromJson(file);
    expect(result, isA<Detail>());
    expect(result, equals(success));
  });
}
