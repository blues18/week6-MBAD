import 'package:flutter/material.dart';
import 'package:navigation_tryout/main.dart';
import 'package:navigation_tryout/screen/gallery_screen.dart';
import 'package:navigation_tryout/screen/help_screen.dart';

class appDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text('hello friend!'),
          automaticallyImplyLeading: false,
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () =>
          Navigator.of(context).pushReplacementNamed(MainScreen.routeName),
        ),
        Divider(height: 3, color: Colors.blueGrey),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text('Gallery'),
          onTap: () =>
          Navigator.of(context).pushReplacementNamed(GalleryScreen.routeName),
        ),
        Divider(height: 3,color: Colors.blueGrey),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Help'),
          onTap: () =>
          Navigator.of(context).pushReplacementNamed(HelpScreen.routeName),
        ),
        Divider(height: 3,color: Colors.blueGrey),
      ]),
    );
  }
}
