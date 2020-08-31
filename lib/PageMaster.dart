import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:skystonescouting20192020/screens/FieldScoutPage.dart';
import 'package:skystonescouting20192020/screens/PitScoutPage.dart';
import 'package:skystonescouting20192020/screens/DataPage.dart';
import 'package:skystonescouting20192020/screens/newPitScoutPage.dart';
import 'package:skystonescouting20192020/screens/newFieldScoutPage.dart';



class PageMaster extends StatefulWidget {

  @override
  _PageMasterState createState() => _PageMasterState();
}

class _PageMasterState extends State<PageMaster> {
  int _navigationBarIndex =0;

  _eachPageFunction()
  {
    if(_navigationBarIndex==0)
    {
      return newPitScoutPage();
    }
    if(_navigationBarIndex==1)
    {
      return FieldScoutPage();
    }
    if(_navigationBarIndex==2)
    {
     return DataPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: _eachPageFunction(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navigationBarIndex,
        items: [
          BottomNavigationBarItem(
            title: Text('PIT'),
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
              title: Text('FIELD'),
              icon: Icon(Icons.add)

          ),
          BottomNavigationBarItem(
              title: Text('DATA'),
              icon: Icon(Icons.show_chart)
          )
        ],
        onTap: (index)
        {
          setState(() {
            _navigationBarIndex=index;
          });

        },
    )
    );
  }

}
