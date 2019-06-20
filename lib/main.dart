import 'package:flutter/material.dart';
import 'package:core/core.dart';


void main(){
  runApp(BottomBarNavigation());
}

class BottomBarNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: App(),
    );
  }
}