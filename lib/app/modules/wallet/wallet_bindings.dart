import 'package:get/get.dart';

import 'domain/repositories/i_get_wallet_repository.dart';
import 'domain/usecases/get_wallet_usecase_impl.dart';
import 'external/datasources/get_wallet_datasource_impl.dart';
import 'infra/datasources/i_get_wallet_datasource.dart';
import 'infra/repositories/get_wallet_repository_impl.dart';
import 'presenter/controllers/wallet_controller.dart';

class WalletBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController(Get.find()));
    //
    Get.lazyPut<IGetWalletUsecase>(() => GetWalletUsecaseImpl(Get.find()));
    Get.lazyPut<IGetWalletRepository>(
        () => GetWalletRepositoryImpl(Get.find()));
    Get.lazyPut<IGetWalletDatasource>(
        () => GetWalletDatasourceImpl(Get.find()));
  }
}
