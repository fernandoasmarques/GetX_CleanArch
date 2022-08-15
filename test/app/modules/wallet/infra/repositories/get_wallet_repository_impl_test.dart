import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/currency.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/detail.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/errors/errors.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/datasources/i_get_wallet_datasource.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/models/wallet_model.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/repositories/get_wallet_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockIGetWalletDatasource extends Mock implements IGetWalletDatasource {}

void main() {
  late MockIGetWalletDatasource mockIGetWalletDatasource;
  late GetWalletRepositoryImpl getWalletRepositoryImpl;

  setUp(() {
    mockIGetWalletDatasource = MockIGetWalletDatasource();
    getWalletRepositoryImpl = GetWalletRepositoryImpl(mockIGetWalletDatasource);
  });

  final success = WalletModel(
      message: 'All Coins',
      walletId: 'c0inS-13435-2342-zksh-34556',
      userBalance: '15.455',
      data: [
        Currency(
          currencyName: 'Bitcoin',
          cotation: '194.706',
          symbol: 'BTC',
          imageUrl:
              'https://panda-crypto-images.s3.amazonaws.com/512d12d5c9a9b30c6d53-Bitcoin.png',
          detail: Detail(
            about: 'O criador inicial do Bitcoin...',
            fee: 3.345,
          ),
        )
      ]);

  final error = WalletException('error');

  group('Datasource', () {
    test('Deve retornar Wallet quando a chamada ao datasource for bem sucedido',
        () async {
      when(() => mockIGetWalletDatasource.getWallet())
          .thenAnswer((_) async => success);

      final result = await getWalletRepositoryImpl.getWallet();
      verify(() => mockIGetWalletDatasource.getWallet());

      expect(result, equals(Right(success)));
    });

    test(
        'Deve retornar WalletException quando a chamada ao datasource for mal sucedido',
        () async {
      when(() => mockIGetWalletDatasource.getWallet()).thenThrow(error);

      final result = await getWalletRepositoryImpl.getWallet();
      verify(() => mockIGetWalletDatasource.getWallet());
      expect(result, equals(Left(error)));
    });
  });
}
