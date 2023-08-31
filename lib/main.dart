import 'package:aprendendo_flutter/modules/home/home_page.dart';
import 'package:aprendendo_flutter/modules/home/second_page.dart';
import 'package:aprendendo_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        AppRoutes.HOME: (context) => HomePage(),
        AppRoutes.SEGUNDA_PAGINA: (context) => SecondPage(),
      },
    );
  }
}
