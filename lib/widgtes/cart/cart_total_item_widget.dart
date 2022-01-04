import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CartTotalItemWidget extends StatelessWidget {
  const CartTotalItemWidget(
      {Key? key,required this.texto, required this.valor, required this.isSubTotal})
      : super(key: key);

  final String valor;
  final bool isSubTotal;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
         texto,
          style: GoogleFonts.jetBrainsMono(
              fontSize: isSubTotal ? 20 : 16, fontWeight: FontWeight.bold),
        ),
        Text(
          valor,
          style: GoogleFonts.jetBrainsMono(
              fontSize: isSubTotal ? 20 : 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
