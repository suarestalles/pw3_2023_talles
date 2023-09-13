import 'package:aprendendo_flutter/theme/my_colors.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Card(
                color: Colors.red,
                elevation: 5,
                child: ListTile(
                  title: Text(
                    'Sair',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}