import 'dart:convert';

import 'package:final_exam/Screen/Model/covid_model.dart';
import 'package:http/http.dart'as http;
class ApiHelper
{
  static ApiHelper apiHelper =ApiHelper();

  Future<List<CovidModel>> getApiData()
  async {
    String? link = 'https://corona.lmao.ninja/v2/countries';
    var response = await http.get(Uri.parse(link));

    List json = jsonDecode(response.body);

    List<CovidModel> l1 = json.map((e) => CovidModel.fromJson(e)).toList();

    return l1;
  }
}