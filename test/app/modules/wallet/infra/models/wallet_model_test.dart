import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/wallet.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/models/currency_model.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/models/detail_model.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/models/wallet_model.dart';

void main() {
  final file = File('test/app/criptomoedas.json').readAsStringSync();

  final success = WalletModel(
      message: 'All Coins',
      walletId: 'c0inS-13435-2342-zksh-34556',
      userBalance: '15.455',
      data: [
        CurrencyModel(
          currencyName: 'Bitcoin',
          cotation: '194.706',
          symbol: 'BTC',
          imageUrl:
              'https://panda-crypto-images.s3.amazonaws.com/512d12d5c9a9b30c6d53-Bitcoin.png',
          detail: DetailModel(
            about: 'O criador inicial do Bitcoin...',
            fee: 3.345,
          ),
        )
      ]);

  test('Deve retornar um WalletModel a partir do JSON', () async {
    final result = WalletModel.fromJson(file);
    expect(result, equals(success));
    expect(result, isA<Wallet>());
  });
}
