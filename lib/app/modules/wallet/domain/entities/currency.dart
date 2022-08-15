import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/currency_formatter.dart';
import 'detail.dart';

class Currency extends Equatable with CurrencyFormatter {
  final String? currencyName;
  final Decimal? cotation;
  final String? symbol;
  final String? imageUrl;
  final Detail? detail;

  Currency({
    String? cotation,
    this.currencyName,
    this.symbol,
    this.imageUrl,
    this.detail,
  }) : cotation = Decimal.tryParse(cotation ?? '0');

  String get cotationFormatted => currencyFormatted(cotation, showSymbol: true);

  @override
  List<Object?> get props => [
        currencyName,
        cotation,
        symbol,
        imageUrl,
        detail,
        cotationFormatted,
      ];

  @override
  bool? get stringify => true;
}
