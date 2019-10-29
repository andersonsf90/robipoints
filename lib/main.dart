import 'package:flutter/material.dart';
import 'package:robi_points_weightlifting/ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.dark,
        //unselectedWidgetColor:Colors.amberAccent
      toggleableActiveColor: Colors.white
    ),
  ));
}

