import 'package:flutter/material.dart';

class AnnouncmentScreen extends StatelessWidget {
  static String routeName = '/announcement';


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Announcement'),
          bottom: TabBar(tabs: [
            Tab(text: 'General',),
            Tab(text: 'Promotion',)
          ],),
        ),
        body: TabBarView(children: [
          Center(child: Text('General Section')),
          Center(child: Text('Promotions Sections')),
        ]),
      ),
    );
  }
}
