import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'controller.dart';
import 'package:get/get.dart';

import 'model.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends GetView<FetchController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FetchController());

    // fetchData();
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          return Container(
              child: controller.loading.value == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      // controller: controller.scrollController,
                      itemCount: controller.item.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < controller.item.length) {
                          var address = controller.item[index].name;
                          return Container(
                            padding: const EdgeInsets.all(8),
                            height: 200,
                            child: Card(
                              shadowColor: Colors.blue,
                              elevation: 7,
                              child: Text(
                                address!,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          controller.fetchData();
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 32),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      }));
        }));
  }
}
