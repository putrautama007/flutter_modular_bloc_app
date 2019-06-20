import 'package:flutter/material.dart';
import 'ui/movie_list.dart';
import 'ui/sport_list.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }

}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
          height: 50.0,
          items: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Icon(Icons.lens,size: 30,),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Icon(Icons.movie, size: 30,),
            ),
      ],
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index){
          switch (index){
            case 0 :
              setState(() {
                _page = 0;
              });
              break;
            case 1 :
              setState(() {
                _page = 1;
              });
              break;
          }
        },
      ), body: _page == 0 ? SportList() : MovieList());
  }
}