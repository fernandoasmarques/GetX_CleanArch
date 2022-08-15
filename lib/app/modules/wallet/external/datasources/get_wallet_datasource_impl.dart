import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/utils.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasources/i_get_wallet_datasource.dart';
import '../../infra/models/wallet_model.dart';

class GetWalletDatasourceImpl implements IGetWalletDatasource {
  final http.Client _client;

  GetWalletDatasourceImpl(this._client);

  @override
  Future<WalletModel> getWallet() async {
    final response = await _client.get(Uri.parse(Utils.jsonSource), headers: {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'text/plain; charset=utf-8'
    }).timeout(const Duration(seconds: 10));

    await Future.delayed(const Duration(seconds: 3));

    if (response.statusCode == 200) {
      return compute<String, WalletModel>(WalletModel.fromJson, response.body);
    } else {
      throw WalletException('Não foi possível realizar a requisição');
    }
  }
}
