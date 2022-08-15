import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../domain/entities/wallet.dart';
import '../../../controllers/wallet_controller.dart';
import '../../../widgets/currency_card.dart';

class WalletSuccess extends StatelessWidget {
  WalletSuccess(this._wallet, {Key? key}) : super(key: key);

  final Wallet? _wallet;
  final _controller = Get.find<WalletController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181c1f),
      body: Obx(() {
        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff181c1f),
              ),
            ),
            Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 4,
                    child: Container(
                      color: Colors.transparent,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(fontSize: 14),
                                  children: [
                                    TextSpan(
                                      text: 'Wallet ID: ',
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: _wallet?.walletId,
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w200),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Seu saldo atual:',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(fontSize: 30),
                                      children: [
                                        TextSpan(
                                          text: 'R\$',
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                        TextSpan(
                                          text: _controller.balanceVisible
                                              ? _controller.getWalletObject
                                                  .userBalanceFormatted
                                                  .toString()
                                              : '--------',
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w900),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    onPressed:
                                        _controller.changeBalanceVisibility,
                                    icon: _controller.balanceVisible
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color: Colors.white70,
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            color: Colors.white70,
                                          ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 8,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Container(
                        color: Colors.white,
                        child: ScrollConfiguration(
                          behavior: CustomScrollBehavior(),
                          child: RefreshIndicator(
                            onRefresh: _controller.getWallet,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .85,
                              ),
                              itemCount:
                                  _wallet?.data?.length,
                              itemBuilder: (context, index) {
                                return CurrencyCard(index: index);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ],
        );
      }),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
