import 'package:admin/AllPageutils/AdminPage.dart';
import 'package:admin/api/signinapi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuIteam {
  final String text;
  final IconData icon;

  const MenuIteam({
    required this.text,
    required this.icon,
  });
}

class MenuIteams {
  static const List<MenuIteam> iteamsSuperAdmin = [
    iteamAdmins,
    iteamLogout,
  ];
  static const List<MenuIteam> iteamsadmin = [
    iteamLogout,
  ];
  static const iteamAdmins = MenuIteam(text: 'Admins', icon: Icons.person);

  static const iteamLogout =
      MenuIteam(text: 'LogOut', icon: Icons.logout_rounded);
}

PopupMenuItem<MenuIteam> buildIteam(MenuIteam iteam) =>
    PopupMenuItem<MenuIteam>(
        value: iteam,
        child: Row(
          children: [
            Icon(
              iteam.icon,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              iteam.text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));

onSelect(BuildContext context, MenuIteam item) {
  switch (item) {
    case MenuIteams.iteamAdmins:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AdminPage()));
      break;
    case MenuIteams.iteamLogout:
      final provider =
          Provider.of<GoogleSignInProvider>(context, listen: false);
      provider.logout();
      break;
  }
}
