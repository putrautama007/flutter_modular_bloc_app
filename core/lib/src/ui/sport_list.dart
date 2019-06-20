import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/sport_blocs.dart';
import 'sport_detail.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:shimmer/shimmer.dart';

class SportList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SportListState();
  }
}

class SportListState extends State<SportList> {
  final bloc = SportBlocs();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();

  @override
  void initState() {
    bloc.fetchAllSport();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sport'),
      ),
      body: StreamBuilder(
          stream: bloc.allSports,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return GridView.builder(
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index){
                return GridTile(
                  child: SizedBox(
                    width: 200.0,
                    height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return Center(
      child: EasyRefresh(
        key: _easyRefreshKey,
        behavior: ScrollBehavior(),
        refreshHeader: PhoenixHeader(key: _headerKey),
        child: GridView.builder(
            itemCount: snapshot.data.results.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: InkResponse(
                  enableFeedback: true,
                  child: Image.network(
                    '${snapshot.data.results[index].strSportThumb}',
                    fit: BoxFit.cover,
                  ),
                  onTap: () => openDetailPage(snapshot.data, index),
                ),
              );
            }),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              bloc.fetchAllSport();
            });
          });
        },
      ),
    );
  }

  openDetailPage(ItemModel data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return SportDetail(
          strSport: data.results[index].strSport,
          strThumb: data.results[index].strSportThumb,
          srtDescription: data.results[index].strSportDescription,
        );
      }),
    );
  }
}
