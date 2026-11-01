import 'package:flutter/material.dart';
import 'package:skill_share/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.person,size: 64,
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0,top: 25.0),
            child: ListTile(
              title: Text("HOME"),
            leading: Icon(Icons.home),
              onTap: ()=> Navigator.pop(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0,top: 25.0),
            child: ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.person),
              onTap: (){
                  Navigator.pop(context);
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> ProfilePage(),
              ),);

              }

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0,top: 25.0),
            child: ListTile(
              title: Text("Setting"),
              leading: Icon(Icons.settings),
            ),
          ),

        ],
      ),
    );
  }
}
