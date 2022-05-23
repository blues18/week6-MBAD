import 'package:flutter/material.dart';

import '../model/photo.dart';

class PhotoScreen extends StatelessWidget {
  static String routeName = '/photo';



  @override
  Widget build(BuildContext context) {
    Photo selectedPhoto = ModalRoute.of(context)?.settings.arguments as Photo;

    return Scaffold(
      appBar: AppBar(
        title: Text('Photo'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Image.network(selectedPhoto.imageUrl),
            SizedBox(height: 10),
            Text(selectedPhoto.countryName,style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 10),
            Text(selectedPhoto.dateTimeAdded.toString(),style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      )
    );
  }
}
