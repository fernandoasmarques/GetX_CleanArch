import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/wallet_controller.dart';
import 'states/wallet_error.dart';
import 'states/wallet_loading.dart';

class WalletPage extends StatelessWidget {
  const WalletPage(this._controller, {Key? key}) : super(key: key);

  final WalletController _controller;

  @override
  Widget build(BuildContext context) {
    return _controller.obx(
        (state) {
          return Scaffold(
            appBar: AppBar(),
            body: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 1, color: const Color(0xFFE5E5E5))),
                      child: Shimmer.fromColors(
                        baseColor: const Color(0xFFE5E5E5),
                        highlightColor: const Color(0xFFF9FAFE),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      _createComponent(20, 40, 40),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _createComponent(5, 20, 60),
                                          const SizedBox(height: 5),
                                          _createComponent(5, 25, 20)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        },
        onLoading: const WalletLoading(),
        onError: (errorMessage) {
          return WalletError(exceptionMessage: errorMessage ?? '');
        });
  }

  Widget _createComponent(
    double circular,
    double heightContainer,
    double widthContainer,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(circular),
      child: Container(
        height: heightContainer,
        width: widthContainer,
        color: Colors.grey,
      ),
    );
  }
}
