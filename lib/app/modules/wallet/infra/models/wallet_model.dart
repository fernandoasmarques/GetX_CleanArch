import 'dart:convert';

import '../../domain/entities/currency.dart';
import '../../domain/entities/wallet.dart';
import 'currency_model.dart';

class WalletModel extends Wallet {
  WalletModel({
    required super.userBalance,
    required super.message,
    required super.walletId,
    required super.data,
  });

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
        message: map['message'],
        walletId: map['wallet_id'],
        userBalance: map['user_balance'],
        data: List.from(map['data']).map<Currency>((e) => CurrencyModel.fromMap(e)).toList());
  }

  factory WalletModel.fromJson(String source) =>
      WalletModel.fromMap(json.decode(source));
}
