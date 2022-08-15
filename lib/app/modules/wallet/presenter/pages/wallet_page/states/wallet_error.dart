import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletError extends StatelessWidget {
  final String exceptionMessage;
  const WalletError({Key? key, required this.exceptionMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181c1f),
      body: Center(
          child: Text(
        exceptionMessage,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w300, fontSize: 20, color: Colors.white),
      )),
    );
  }
}
