import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SharedContainer extends StatelessWidget {
  final String catoname;
  final String imagetext;
  final Function() ontapfunction;

  const SharedContainer(
      {super.key,
      required this.catoname,
      required this.imagetext,
      required this.ontapfunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontapfunction,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          // color: Colors.white,
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imagetext)),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            catoname,
            style: GoogleFonts.bebasNeue(
              letterSpacing: 1,
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              shadows: [const Shadow(blurRadius: 100)],
            ),
          ),
        ),
      ),
    );
  }
}
