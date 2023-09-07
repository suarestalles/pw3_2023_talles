import 'package:aprendendo_flutter/modules/cachorro/pages/cachorro_list_page.dart';
import 'package:aprendendo_flutter/modules/home/pages/home_page.dart';
import 'package:aprendendo_flutter/modules/home/pages/second_page.dart';
import 'package:aprendendo_flutter/theme/my_theme.dart';
import 'package:aprendendo_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        home: const HomePage(),
        routes: {
          AppRoutes.HOME: (context) => const HomePage(),
          AppRoutes.SEGUNDA_PAGINA: (context) => const SecondPage(),
          AppRoutes.CACHORRO_LIST_PAGE: (context) => CachorroListPage(),
        },
      ),
    );
  }
}
