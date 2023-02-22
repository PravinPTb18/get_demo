import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_demo/controller/users_controller.dart';
import 'package:get_demo/pages/api_demo_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Creating instance using Get.put() to make it available for all "child" routes.
  final UsersController uc = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("GetX Demo "),
            // Displaying the count value using obx
            Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    uc.count.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                )),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  // Calling function to increase the count value
                  uc.incrementCount();
                },
                child: const Text("Increment count")),
            OutlinedButton(
                onPressed: () {
                  // Navigate to api demo page
                  Get.to(() => ApiDemoPage());
                },
                child: const Text("Api Demo"))
          ],
        ),
      ),
    );
  }
}
