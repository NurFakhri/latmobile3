import 'dart:convert';
import 'package:delivery/model/food_model.dart';
import 'package:http/http.dart' as http;

class FoodApi {
  static Future<List<Food>> getFood() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list",
        {"limit": '24', "start": '0', 'tag': 'list.recipe.popular'});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'a599cc46bbmsh7834a6a3dbd91d9p1701dajsn3acce650fffb',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Food.foodFromSnapShot(_temp);
  }
}
