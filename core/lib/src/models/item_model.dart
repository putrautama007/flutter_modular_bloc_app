class ItemModel{
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson){
    print(parsedJson['sports'].length);
    List<_Result> temp = [];
    for( int i = 0; i < parsedJson['sports'].length; i++){
      _Result result = _Result(parsedJson['sports'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

}

class _Result {
  String _idSport;
  String _strSport;
  String _strSportThumb;
  String _strSportDescription;

  _Result(result){
    _idSport = result['idSport'];
    _strSport = result['strSport'];
    _strSportThumb =result['strSportThumb'];
    _strSportDescription = result['strSportDescription'];
  }

  String get strSportDescription => _strSportDescription;

  String get strSportThumb => _strSportThumb;

  String get strSport => _strSport;

  String get idSport => _idSport;


}
