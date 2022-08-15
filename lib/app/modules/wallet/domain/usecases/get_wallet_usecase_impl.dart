import 'package:dartz/dartz.dart';

import '../entities/wallet.dart';
import '../errors/errors.dart';
import '../repositories/i_get_wallet_repository.dart';

abstract class IGetWalletUsecase {
  Future<Either<WalletException, Wallet>> call();
}

class GetWalletUsecaseImpl implements IGetWalletUsecase {
  final IGetWalletRepository _repository;

  GetWalletUsecaseImpl(this._repository);

  @override
  Future<Either<WalletException, Wallet>> call() => _repository.getWallet();
}

// criar um getRandomImage