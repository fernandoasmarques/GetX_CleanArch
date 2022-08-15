import 'package:dartz/dartz.dart';

import '../../domain/entities/wallet.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/i_get_wallet_repository.dart';
import '../datasources/i_get_wallet_datasource.dart';

class GetWalletRepositoryImpl implements IGetWalletRepository {
  final IGetWalletDatasource _datasource;

  GetWalletRepositoryImpl(this._datasource);

  @override
  Future<Either<WalletException, Wallet>> getWallet() async {
    try {
      return Right(await _datasource.getWallet());
    } on WalletException catch (e) {
      return Left(e);
    }
  }
}
