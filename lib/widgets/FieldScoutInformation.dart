import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldScoutInformation extends StatelessWidget {
  List<String> teamInfo;
  FieldScoutInformation(this.teamInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Autonomous",
              style: GoogleFonts.abhayaLibre(
                  decoration: TextDecoration.underline, fontSize: 22)),
        ],
      ),
    );
  }
}
