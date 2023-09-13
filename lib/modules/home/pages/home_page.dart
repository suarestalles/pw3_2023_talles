import 'package:aprendendo_flutter/theme/my_colors.dart';
import 'package:aprendendo_flutter/utils/app_routes.dart';
import 'package:aprendendo_flutter/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text(
            'HomePage',
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 150,
              child: InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(AppRoutes.CACHORRO_LIST_PAGE),
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pets,
                          size: 50,
                          color: MyColors.secondaryColor,
                        ),
                        Text(
                          'Listagem de Cachorros',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
