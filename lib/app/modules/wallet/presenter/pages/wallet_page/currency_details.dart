import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../controllers/wallet_controller.dart';

class CurrencyDetails extends StatelessWidget {
  final _controller = Get.find<WalletController>();
  final Map<String, dynamic> arguments;

  CurrencyDetails({
    Key? key,
  })  : arguments = Get.arguments,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final object = _controller.getCurrencyByIndex(arguments['index']);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                flex: 6,
                child: Container(
                  color: const Color(0xff181c1f),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: object?.imageUrl ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              object?.symbol ?? '',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              '•',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              object?.currencyName ?? '',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          object?.cotationFormatted ?? '',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sobre'.toUpperCase(),
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        object?.detail?.about ?? '',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FloatingActionButton(
                child: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
