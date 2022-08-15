import 'modules/wallet/presenter/pages/wallet_page/currency_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_bindings.dart';
import 'modules/wallet/presenter/pages/wallet_page/wallet_page.dart';
import 'modules/wallet/wallet_bindings.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      getPages: [
        GetPage(
            name: '/',
            page: () => WalletPage(Get.find()),
            binding: WalletBindings()),
        GetPage(
            name: '/currency',
            page: () => CurrencyDetails(),
            transition: Transition.downToUp,
            binding: WalletBindings()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
