import 'package:flutter/material.dart';
import 'package:navigation_tryout/providers%20folder/photo_list.dart';
import 'package:navigation_tryout/screen/photo_screen.dart';
import 'package:navigation_tryout/widgets/app-drawer.dart';
import 'package:provider/provider.dart';

import '../model/photo.dart';

class GalleryScreen extends StatelessWidget {
  static String routeName ='/gallery';

  @override
  Widget build(BuildContext context) {
    PhotoList myPhotos = Provider.of<PhotoList>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: ListView.builder(itemBuilder: (ctx, i) {
        Photo currentPhoto = myPhotos.getPhotoList()[i];
        return Container(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.network(currentPhoto.imageUrl),
            title: Text(currentPhoto.countryName),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {myPhotos.removedPhoto(i);},
            ),
            onTap: () {
              Navigator.of(context).pushNamed(PhotoScreen.routeName,arguments: currentPhoto);
            },
          ),
        );
      },
      itemCount: myPhotos.getPhotoList().length
      ),
      drawer: appDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myPhotos.addPhoto(
              Photo('https://i.postimg.cc/DzWN4Cn2/singapore.jpg',
                'Singapore',
              DateTime.now()
              )
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
