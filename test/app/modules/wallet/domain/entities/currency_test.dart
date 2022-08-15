import 'package:flutter_test/flutter_test.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/currency.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/detail.dart';

void main() {
  late Currency obj1;
  late Currency obj2;
  late Currency obj3;

  const currencyString =
      'Currency(Nome, 100.001, ABC, https:teste.png, Detail(Teste, 1.001), R\$ 100.001,00)';

  setUp(() {
    obj1 = Currency(
        currencyName: 'Nome',
        cotation: '100.001',
        symbol: 'ABC',
        imageUrl: 'https:teste.png',
        detail: Detail(about: 'Teste', fee: 1.001));
    obj2 = Currency(
        currencyName: 'Nome',
        cotation: '100.001',
        symbol: 'ABC',
        imageUrl: 'https:teste.png',
        detail: Detail(about: 'Teste', fee: 1.001));
    obj3 = Currency(
        currencyName: 'NomeABCDE',
        cotation: '0.76',
        symbol: 'ABCDE',
        imageUrl: 'https:teste.png',
        detail: Detail(about: 'Teste', fee: 1.001));
  });
  test('Deve retornar true se quando comparado são os mesmos objetos', () {
    expect(obj1 == obj2, true);
    expect(obj2 == obj1, true);
    expect(obj1.hashCode == obj2.hashCode, true);
    expect(obj2.hashCode == obj1.hashCode, true);
  });

  test('Deve retornar false se quando comparado não são os mesmos objetos', () {
    expect(obj1 == obj3, false);
    expect(obj2 == obj3, false);
    expect(obj3 == obj1, false);
    expect(obj3 == obj2, false);
    expect(obj1.hashCode == obj3.hashCode, false);
    expect(obj2.hashCode == obj3.hashCode, false);
    expect(obj3.hashCode == obj1.hashCode, false);
    expect(obj3.hashCode == obj2.hashCode, false);
  });
  test('Deve retornar true se método toString retorna corretamente', () {
    final result = obj1.toString();
    expect(result, equals(currencyString));
  });

  test('Deve retornar a cotação formatada', () {
    expect(obj1.cotationFormatted, equals('R\$ 100.001,00'));
    expect(obj3.cotationFormatted, equals('R\$ 0,76'));
  });
}
