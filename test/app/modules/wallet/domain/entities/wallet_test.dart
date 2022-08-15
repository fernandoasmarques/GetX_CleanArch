import 'package:flutter_test/flutter_test.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/currency.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/detail.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/wallet.dart';

void main() {
  late Wallet wallet1;
  late Wallet wallet2;

  const walletString =
      'Wallet(Teste, 123456, 12.345, [Currency(Nome, 100, ABC, https:teste.png, Detail(Teste, 1.001), R\$ 100,00)],  12.345,00)';

  setUp(() {
    wallet1 = Wallet(
        message: 'Teste',
        walletId: '123456',
        userBalance: '12.345',
        data: [
          Currency(
            currencyName: 'Nome',
            cotation: '100.000',
            symbol: 'ABC',
            imageUrl: 'https:teste.png',
            detail: Detail(
              about: 'Teste',
              fee: 1.001,
            ),
          )
        ]);

    wallet2 = Wallet(
        message: 'Teste',
        walletId: '123456',
        userBalance: '12.345',
        data: [
          Currency(
            currencyName: 'Nome',
            cotation: '100.000',
            symbol: 'ABC',
            imageUrl: 'https:teste.png',
            detail: Detail(
              about: 'Teste',
              fee: 1.001,
            ),
          )
        ]);
  });

  test('Deve retornar true se quando comparado são os mesmos objetos', () {
    expect(wallet1 == wallet2, true);
    expect(wallet2 == wallet1, true);
    expect(wallet1.hashCode == wallet2.hashCode, true);
    expect(wallet2.hashCode == wallet1.hashCode, true);
  });

  test('Deve retornar true se método toString retorna corretamente', () {
    final result = wallet1.toString();
    expect(result, equals(walletString));
  });
}
