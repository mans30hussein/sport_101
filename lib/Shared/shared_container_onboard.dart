import 'package:flutter/material.dart';

class Boarding extends StatelessWidget {
  final Color backgroundColor;
  final String imagePass;
  final String title;
  final double uniSize;

  const Boarding({
    required this.uniSize,
    required this.backgroundColor,
    required this.imagePass,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,
      child: Column(
        children: [
          Expanded(
              flex: 6,
              child: Center(
                child: Image.asset(
                  imagePass,
                  height: MediaQuery.of(context).size.height * uniSize,
                  width: MediaQuery.of(context).size.width * uniSize,
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 3,
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: "Georgia",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
