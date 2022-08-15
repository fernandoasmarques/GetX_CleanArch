import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

mixin CurrencyFormatter {
  String currencyFormatted(Decimal? numberDecimal, {bool showSymbol = false}) {
    final thousand = Decimal.parse('1000');
    if (numberDecimal?.scale == 3) {
      final value =
          (thousand * (numberDecimal ?? Decimal.parse('0'))).toStringAsFixed(2);
      return _toCurrency(value, showSymbol);
    } else {
      return _toCurrency(numberDecimal?.toStringAsFixed(2), showSymbol);
    }
  }

  String _toCurrency(String? value, bool showSymbol) => NumberFormat.currency(
          locale: 'pt_BR', symbol: showSymbol ? 'R\$' : '', decimalDigits: 2)
      .format(double.parse(value ?? '0'));
}
