import 'dart:convert';

import '../../domain/entities/currency.dart';
import 'detail_model.dart';

class CurrencyModel extends Currency {
  CurrencyModel({
    required super.currencyName,
    required super.cotation,
    required super.symbol,
    required super.imageUrl,
    required super.detail,
  });

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      currencyName: map['currency_name'] ?? '',
      cotation: map['cotation'] ?? '',
      symbol: map['symbol'] ?? '',
      imageUrl: map['image_url'] ?? '',
      detail: DetailModel.fromMap(map['details']),
    );
  }

  factory CurrencyModel.fromJson(String source) =>
      CurrencyModel.fromMap(json.decode(source));
}
