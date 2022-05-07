import 'dart:convert';

import 'package:food_app/src/model/model.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  Future<List<RecipeModel>> getData() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list",
        {"limit": '24', "start": '0', "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'X-RapidAPI-Key': '71779f96ebmshbeb610a1e4cc559p153cadjsn3115af4f4d12',
      'useQueryString': "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data["feed"]) {
      _temp.add(i["content"]["details"]);
    }
    return RecipeModel.recipeFromSnap(_temp);
  }
}
