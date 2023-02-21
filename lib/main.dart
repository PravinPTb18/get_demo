import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_demo/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              centerTitle: true,
              titleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 20.0),
              color: Colors.deepOrange.shade400),
          useMaterial3: true,
          colorSchemeSeed: Colors.deepOrange),
      home: HomePage(),
    );
  }
}
