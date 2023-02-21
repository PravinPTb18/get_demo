import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_demo/controller/users_controller.dart';

class ApiDemoPage extends StatelessWidget {
  ApiDemoPage({super.key});

  final UsersController uc = Get.put(UsersController());
  late double _height;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      appBar: AppBar(
        title: Text("Api Demo ${uc.count}"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
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
                uc.decrementCount();
              },
              child: const Text("Decrement count")),
          _listOfUser(),
        ],
      ),
    );
  }

  Widget _listOfUser() {
    return Obx(() {
      return uc.isLoading.isTrue
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: _height,
              child: ListView.builder(
                  itemCount: uc.usersList.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration:
                              BoxDecoration(color: Colors.amber.shade400),
                          child: Row(
                            children: [
                              const Text(
                                "Name : ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                uc.usersList[index].name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 2,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )),
            );
    });
  }
}
