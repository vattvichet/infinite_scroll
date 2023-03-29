import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class FetchController extends GetxController {
  RxBool loading = true.obs;

  RxInt limitItem = 5.obs;

  RxList item = <Users>[].obs;

  String url = 'https://jsonplaceholder.typicode.com/users?_limit=5';
  var client = http.Client();

  Future<void> fetchData() async {
    http.Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Connection Ok
      List responseJson = json.decode(response.body);
      responseJson.map((m) => item.add(Users.fromJson(m))).toList();

      loading.value = false;
    } else {
      throw ('error');
    }
  }

  @override
  void onInit() async {
    await fetchData();

    super.onInit();
  }
}
