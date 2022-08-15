import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/currency.dart';
import '../../domain/entities/wallet.dart';
import '../../domain/errors/errors.dart';
import '../../domain/usecases/get_wallet_usecase_impl.dart';

class WalletController extends GetxController with StateMixin<Wallet> {
  final IGetWalletUsecase _getWalletUsecase;
  final _wallet = Wallet().obs;
  final cardCurrencyColors = <Color>[].obs;
  final _balanceVisible = false.obs;

  WalletController(this._getWalletUsecase);

  Wallet get getWalletObject => _wallet.value;
  bool get balanceVisible => _balanceVisible.value;

  void changeBalanceVisibility() =>
      _balanceVisible.value = !_balanceVisible.value;

  Currency? getCurrencyByIndex(int index) {
    return _wallet.value.data?[index];
  }

  @override
  void onInit() {
    getWallet();
    super.onInit();
  }

  Future<void> getWallet() async {
    final result = await _getWalletUsecase();
    result.fold(_errorGetWallet, _successGetWallet);
  }

  void _successGetWallet(Wallet wallet) {
    _wallet.value = wallet;
    change(wallet, status: RxStatus.success());
  }

  void _errorGetWallet(WalletException exception) {
    change(null, status: RxStatus.error(exception.message));
  }
}
