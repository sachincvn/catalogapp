import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Sachin Chavan",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                accountEmail: Text("sachincvn@gmail,com",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/147/147142.png"),
                ),
              )),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: Text("Profile"),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail),
            title: Text("Contact"),
          )
        ],
      ),
    );
  }
}
