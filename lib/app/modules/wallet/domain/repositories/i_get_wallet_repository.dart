import 'package:dartz/dartz.dart';

import '../entities/wallet.dart';
import '../errors/errors.dart';

abstract class IGetWalletRepository{
  Future<Either<WalletException, Wallet>> getWallet();
}