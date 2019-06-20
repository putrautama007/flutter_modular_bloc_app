import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';


class SportApiProvider{
  Client client = Client();
  final _apiKey = '1';
  
  Future<ItemModel> fetchSportList() async{
    print("entered");
    final response = await client.get("https://www.thesportsdb.com/api/v1/json/1/all_sports.php");
    print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load post');
    }
  }
}