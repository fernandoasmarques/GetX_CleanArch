import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/errors/errors.dart';
import 'package:getx_cleanarch/app/modules/wallet/domain/usecases/get_wallet_usecase_impl.dart';
import 'package:getx_cleanarch/app/modules/wallet/infra/models/wallet_model.dart';
import 'package:getx_cleanarch/app/modules/wallet/presenter/controllers/wallet_controller.dart';
import 'package:mocktail/mocktail.dart';

class MockGetWalletUsecase extends Mock implements IGetWalletUsecase {}

void main() {
  late MockGetWalletUsecase mockWalletUsecase;
  late WalletController walletController;

  setUp(() {
    mockWalletUsecase = MockGetWalletUsecase();
    walletController = WalletController(mockWalletUsecase);
  });

  final file = File('test/app/criptomoedas.json').readAsStringSync();
  final tWallet = WalletModel.fromJson(file);
  final tError = WalletException('error');

  test(
      'Deve verificar se _getWallet() está sendo chamado chamado e retorna Right(Wallet)',
      () async {
    when(() => mockWalletUsecase.call())
        .thenAnswer((_) async => Right(tWallet));
    Get.put(walletController); // onInit()
    await untilCalled(() => mockWalletUsecase());
    verify(() => mockWalletUsecase());
    Get.delete<WalletController>(); // onClose();
  });
  test(
      'Deve verificar se _getWallet() está sendo chamado e retorna Left(WalletException)',
      () async {
    when(() => mockWalletUsecase.call()).thenAnswer((_) async => Left(tError));
    //
    Get.put(walletController); // onInit()
    await untilCalled(() => mockWalletUsecase());
    verify(() => mockWalletUsecase());
    Get.delete<WalletController>(); // onClose();
  });
}
