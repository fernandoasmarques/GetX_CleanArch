import 'dart:convert';

import '../../domain/entities/detail.dart';

class DetailModel extends Detail {
  DetailModel({
    required super.about,
    required super.fee,
  });

  factory DetailModel.fromMap(Map<String, dynamic> map) {
    return DetailModel(about: map['about'] ?? '', fee: map['fee'] ?? '');
  }

  factory DetailModel.fromJson(String source) =>
      DetailModel.fromMap(json.decode(source));
}
