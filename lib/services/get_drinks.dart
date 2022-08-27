import 'dart:convert';
import 'dart:developer';

import 'package:assignment_intervel/model/drink_model.dart';
import 'package:dio/dio.dart';

import 'api/api.dart';

class GetDrinks extends Api {
  getData({required text}) async {
    try {
      final response = await Dio().get('$uri$text');
      if (response.statusCode == 200) {
        final res = drinkListFromJson(response.data['drinks']);
        return res;
      }
      log(response.statusCode.toString());
    } catch (e) {
      log('exeption : $e');
      return 'e';
    }
  }
}
