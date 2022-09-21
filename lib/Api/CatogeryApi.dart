import 'dart:convert';

import 'package:bloc_demo/Api/ApiClient.dart';
import 'package:bloc_demo/Model/CatogeryModel.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';


class CatogeryApi{
  ApiClient apiClient=ApiClient();
  Future<CatogeryModel>Player()async{
    String path="players/topscorers?season=2019&league=39";
    Response response=await apiClient.invokeApi(path: path, method: "GET", body: null);
    return CatogeryModel.fromJson(jsonDecode(response.body));
  }
}