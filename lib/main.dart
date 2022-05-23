import 'package:flutter/material.dart';
import 'package:navigation_tryout/model/photo.dart';
import 'package:navigation_tryout/providers%20folder/photo_list.dart';
import 'package:provider/provider.dart';
import 'screen/announcement_screen.dart';
import 'screen/gallery_screen.dart';
import 'screen/help_screen.dart';
import 'screen/photo_screen.dart';
import 'widgets/app-drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhotoList>(
          create: (ctx) => PhotoList(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
        routes: {
          AnnouncmentScreen.routeName : (_) {return AnnouncmentScreen(); },
          HelpScreen.routeName : (_) {return HelpScreen(); },
          PhotoScreen.routeName : (_) {return PhotoScreen(); },
          GalleryScreen.routeName : (_) {return GalleryScreen(); },
        },
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    PhotoList myPhotos = Provider.of<PhotoList>(context);
    Photo latestPhoto = myPhotos.getLatestPhoto();
    return Scaffold(
      appBar: AppBar(
        title: Text('navigation'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => Navigator.of(context).pushNamed(AnnouncmentScreen.routeName),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Text('latest photo', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            Image.network(latestPhoto.imageUrl),
            SizedBox(height: 10),
            Text(latestPhoto.countryName, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 10,),
            Text(latestPhoto.dateTimeAdded.toString(), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
      drawer: appDrawer(),
    );
  }
}
