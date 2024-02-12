import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataRowPlayer extends StatelessWidget {
  const DataRowPlayer(
      {super.key, required this.PlayerKey, required this.PlayerValue});

  final String PlayerKey;
  final String? PlayerValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          PlayerKey,
          style: GoogleFonts.bebasNeue(
            textStyle: TextStyle(
                fontSize: 18,
                color: const Color(0xFFFFFFFF).withOpacity(0.8),
                wordSpacing: 1.5),
          ),
        ),
        Text(
          PlayerValue!,
          style: GoogleFonts.bebasNeue(
            textStyle: TextStyle(
                fontSize: 18,
                color: const Color(0xFFFFFFFF).withOpacity(0.8),
                wordSpacing: 1.5),
          ),
        ),
      ],
    );
  }
}

showNetworkAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: const Text('Check Your Network Connection'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

RowDate(BuildContext context) {
  const Align(
    widthFactor: 0.9,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('PlayerKey'),
        Text('PlayerValue'),
      ],
    ),
  );
}
