import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

import '../controllers/wallet_controller.dart';

class CurrencyCard extends StatelessWidget {
  final int index;
  final _controller = Get.find<WalletController>();

  CurrencyCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = _controller.getCurrencyByIndex(index);

    return InkWell(
      onTap: () {
        Get.toNamed("/currency", arguments: {'index': index});
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency?.symbol ?? '',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w900, fontSize: 20),
                ),
                const SizedBox(height: 5),
                Text(
                  currency?.currencyName ?? '',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w300, fontSize: 16),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: currency?.imageUrl ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    currency?.cotationFormatted ?? '',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
