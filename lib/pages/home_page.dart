import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_demo/controller/users_controller.dart';
import 'package:get_demo/pages/api_demo_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final UsersController uc = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Demo "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    uc.count.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                )),
            OutlinedButton(
                onPressed: () {
                  uc.incrementCount();
                },
                child: const Text("Increment count")),
            OutlinedButton(
                onPressed: () {
                  Get.to(() => ApiDemoPage());
                },
                child: const Text("Api Demo"))
          ],
        ),
      ),
    );
  }
}
