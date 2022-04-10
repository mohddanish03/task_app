import 'package:get/get.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_app/Models/topModel.dart';

import '../Models/Nowmodel.dart';

class ControllerPage extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void initState() {
    getMovieApi();
    getTopRatedApi();
  }

//Now playing
  Future<Model> getMovieApi() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Model.fromJson(data);
    } else {
      return Model.fromJson(data);
    }
  }

  //Top rated Api
  Future<TopRatedModel> getTopRatedApi() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return TopRatedModel.fromJson(data);
    } else {
      return TopRatedModel.fromJson(data);
    }
  }
}
