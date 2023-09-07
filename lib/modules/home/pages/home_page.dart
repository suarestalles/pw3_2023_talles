import 'package:aprendendo_flutter/theme/my_colors.dart';
import 'package:aprendendo_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                accountName: Text("Talles Suares"),
                accountEmail: Text("tallessuares@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 200,
                  backgroundImage: AssetImage("assets/images/imagemUser.jpg"),
                ),
                currentAccountPictureSize: Size(80, 80),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: MyColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: Text(
                    'Second Page',
                    style: TextStyle(
                      color: MyColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: Text(
                    'Cachorros',
                    style: TextStyle(
                      color: MyColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: Text(
                    'Gatos',
                    style: TextStyle(
                      color: MyColors.secondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
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
