import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/currency.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/detail.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/entities/wallet.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/errors/errors.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/repositories/i_get_wallet_repository.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/usecases/get_wallet_usecase_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockIGetWalletRepository extends Mock implements IGetWalletRepository {}

void main() {
  late GetWalletUsecaseImpl usecase;
  late MockIGetWalletRepository mockIGetWalletRepository;

  setUp(() {
    mockIGetWalletRepository = MockIGetWalletRepository();
    usecase = GetWalletUsecaseImpl(mockIGetWalletRepository);
  });

  final success = Wallet(
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

  test('Deve retornar uma instância da classe Wallet', () async {
    when(() => mockIGetWalletRepository.getWallet())
        .thenAnswer((_) async => Right(success));

    final result = await usecase.call();

    expect(result, equals(Right(success)));
    verify(() => mockIGetWalletRepository.getWallet());
    verifyNoMoreInteractions(mockIGetWalletRepository);
  });

  test('Deve retornar um exception caso o retorno seja Left(Wallet Exception)',
      () async {
    when(() => mockIGetWalletRepository.getWallet())
        .thenAnswer((_) async => Left(error));

    final result = await usecase.call();

    expect(result, equals(Left(error)));
    verify(() => mockIGetWalletRepository.getWallet());
    verifyNoMoreInteractions(mockIGetWalletRepository);
  });
}
