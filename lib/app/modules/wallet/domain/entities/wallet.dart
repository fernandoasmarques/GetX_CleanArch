import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/currency_formatter.dart';
import 'currency.dart';

class Wallet extends Equatable with CurrencyFormatter {
  final String? message;
  final String? walletId;
  final Decimal? userBalance;
  final List<Currency>? data;

  Wallet({
    String? userBalance,
    this.message,
    this.walletId,
    this.data,
  }) : userBalance = Decimal.tryParse(userBalance ?? '0'); // 

  String get userBalanceFormatted => currencyFormatted(userBalance);

  @override
  List<Object?> get props => [
        message,
        walletId,
        userBalance,
        data,
        userBalanceFormatted,
      ];

  @override
  bool? get stringify => true;
}
