import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth.dart';
class FieldScoutPage extends StatefulWidget {
  @override
  _FieldScoutPageState createState() => _FieldScoutPageState();
}

class _FieldScoutPageState extends State<FieldScoutPage> {
  final fieldTeamNumberController = new TextEditingController();
  final  fieldNotesController = new TextEditingController();
int teamNumber;
  AuthorizationService service = new AuthorizationService();


dataStoring(int teamNumber,String fieldNotes) async
{
  await service.updateFieldUserData(teamNumber,fieldNotes);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Container(
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                controller: fieldTeamNumberController,
                decoration: InputDecoration(
                    filled: true,

                    focusColor: Colors.black,
                    labelText: 'Enter Team Number'),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(

              child: TextField(
                maxLines: 15,
                autofocus: false,
                keyboardType: TextInputType.multiline,
                controller: fieldNotesController,
                decoration: InputDecoration(
                    filled: true,
                    focusColor: Colors.white,
                    labelText: 'Enter Notes'),
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                top: 100
              ),
              child: RawMaterialButton(
                splashColor: Colors.black12,
                onPressed: () {

teamNumber=int.parse(fieldTeamNumberController.text);
print(teamNumber.toString());
print(fieldNotesController.text);
        dataStoring(teamNumber,fieldNotesController.text);
        fieldTeamNumberController.clear();
        fieldNotesController.clear();
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Submitted"),
                        duration: Duration(seconds: 4),)
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text("Submit",style:GoogleFonts.abhayaLibre(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),
                  color: Colors.red,
                  height: 40,
                ),
              ),
            ),

          ],

        ),
      ),

    );
  }
}
