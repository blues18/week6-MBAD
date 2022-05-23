import 'package:flutter/cupertino.dart';
import 'package:navigation_tryout/model/photo.dart';

class PhotoList with ChangeNotifier{
  List<Photo>myPhotos = [
    Photo('https://i.postimg.cc/Bv8v8Cds/india.jpg', 'India',
        DateTime.now().subtract(Duration(days: 3))),
    Photo('https://i.postimg.cc/3wPx2vTG/korea.jpg', 'Korea',
        DateTime.now().subtract(Duration(days: 2))),
    Photo('https://i.postimg.cc/VvFsyZb9/japan.jpg', 'Japan',
        DateTime.now().subtract(Duration(days:1))),
    Photo('https://i.postimg.cc/ryGwtsYd/nz.jpg', 'New Zealand',
        DateTime.now().subtract(Duration(days: 4))),
    Photo('https://i.postimg.cc/9FJXJS2C/aust.jpg', 'Australia',
        DateTime.now().subtract(Duration(days: 5)))
  ];
  List<Photo> getPhotoList() {
    return myPhotos;
  }

  void addPhoto (newPhoto) {
    myPhotos.insert(0, newPhoto);
     notifyListeners();
  }
  void removedPhoto(i) {
    myPhotos.removeAt(i);
    notifyListeners();
  }
  Photo getLatestPhoto() {
    List<Photo> temp = List.from(myPhotos);
    temp.sort((a,b){
      if(a.dateTimeAdded.isBefore(b.dateTimeAdded)) return 1;
      else return 0;
    });
    return temp [0];
  }

}