import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCategoriaWidget extends StatelessWidget {
  final String nomeMenu;
  final VoidCallback callback;
  final IconData icon;

  const MenuCategoriaWidget({
    Key? key,
    required this.nomeMenu,
    required this.callback,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              nomeMenu,
              style: GoogleFonts.jetBrainsMono(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
