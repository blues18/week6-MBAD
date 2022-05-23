import 'package:flutter/material.dart';
import 'package:navigation_tryout/widgets/app-drawer.dart';

class HelpScreen extends StatefulWidget {
  static String routeName = '/help';

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(
        child: selectedIndex == 0 ? Text('FAQs Section'):
                selectedIndex == 1? Text('Visit Us Section'):
                Text('Contact Us Section'),
      ),
      drawer: appDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.help_center_rounded),label: "FAQ",),
          BottomNavigationBarItem(icon: Icon(Icons.location_on),label: 'Visit Us',),
          BottomNavigationBarItem(icon: Icon(Icons.send),label: 'Contact US',),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      )
    );
  }
}
