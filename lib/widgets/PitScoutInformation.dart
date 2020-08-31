import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skystonescouting20192020/widgets/CustomTextWidget.dart';


class PitScoutInformation extends StatelessWidget {

  List<String> teamInfo;
  PitScoutInformation(this.teamInfo);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Autonomous",
              style: GoogleFonts.abhayaLibre(
                  decoration: TextDecoration.underline, fontSize: 22)),
          TextWidget("Parking",teamInfo[1]),
          TextWidget("Reposition Foundation",teamInfo[2]),
          TextWidget("Skystones",teamInfo[3]),
          Text("Tele-Op",
              style: GoogleFonts.abhayaLibre(
                  decoration: TextDecoration.underline, fontSize: 22)),
          TextWidget("Maximum Tower Height",teamInfo[4]),
          TextWidget("CapStone",teamInfo[5]),
          TextWidget("Notes",teamInfo[6]),

        ],
      ),
    );
  }
}
