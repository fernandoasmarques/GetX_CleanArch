import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class Detail extends Equatable {
  final String? about;
  final Decimal? fee;

  Detail({
    this.about,
    double? fee,
  }) : fee = Decimal.tryParse(fee.toString());

  @override
  List<Object?> get props => [about, fee];

  @override
  bool? get stringify => true;
}
