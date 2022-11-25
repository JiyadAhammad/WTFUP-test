import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../onboarding.dart';

class OnBoardingContainerWidget extends StatelessWidget {
  const OnBoardingContainerWidget({
    super.key,
    required this.data,
    required this.index,
  });

  final List<ItemData> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: data[index].color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            data[index].image,
            height: 400,
            fit: BoxFit.contain,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                data[index].text1,
                style: GoogleFonts.montserrat(
                  color: Colors.primaries[index + 1][600],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data[index].text2,
                style: GoogleFonts.montserrat(
                  color: Colors.primaries[index + 3][900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data[index].text3,
                style: GoogleFonts.montserrat(
                  color: Colors.primaries[index][900],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
