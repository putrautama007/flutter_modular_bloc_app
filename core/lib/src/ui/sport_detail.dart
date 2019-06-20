import 'package:flutter/material.dart';

class SportDetail extends StatefulWidget {
  final strSport;
  final srtDescription;
  final strThumb;

  SportDetail({this.strSport, this.srtDescription, this.strThumb});

  @override
  State<StatefulWidget> createState() {
    return SportDetailState(
        strSport: strSport, srtDescription: srtDescription, strThumb: strThumb);
  }
}

class SportDetailState extends State<SportDetail> {
  final strSport;
  final srtDescription;
  final strThumb;

  SportDetailState({this.strSport, this.srtDescription, this.strThumb});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    elevation: 0.0,
                    flexibleSpace: FlexibleSpaceBar(
                        background:
                            Image.network("$strThumb", fit: BoxFit.cover)),
                  )
                ];
              },
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(margin: EdgeInsets.only(top: 5.0)),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        strSport,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.description,
                            color: Colors.blue,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 1.0, right: 1.0),
                          ),
                          Text(
                            "Description",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              srtDescription,
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 18.0),
                            ))),
                  ],
                ),
              ))),
    );
  }
}
