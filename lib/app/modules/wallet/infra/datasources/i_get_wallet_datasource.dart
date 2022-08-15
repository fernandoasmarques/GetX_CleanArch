import '../models/wallet_model.dart';

abstract class IGetWalletDatasource {
  Future<WalletModel> getWallet();
}
