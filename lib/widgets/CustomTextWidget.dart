import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';


class TextWidget extends StatelessWidget {
  String label, answer;
  TextWidget(this.label,this.answer);
  @override
  Widget build(BuildContext context) {
    return Text(
      label+": "+answer
    );
  }
}
