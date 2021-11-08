import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ImageGetter {
  final _imagePicker = ImagePicker();
  File _image;

  Future<String> getImageLinkAndUpload() async {
    String imageLink;
    try {
      PickedFile selectedImage =
          await _imagePicker.getImage(source: ImageSource.gallery);
      File newImage = File(selectedImage.path);

      _image = newImage;

      //Uploading to firebase storage after getting the image
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('jumga/${path.basename(_image.path)}');
      await storageReference.putFile(_image).whenComplete(() async {
        print('Successfully uploaded');
        //Getting the image url
        imageLink = await storageReference.getDownloadURL();
      });
      print('Image Link: $imageLink');
      return imageLink;
    } catch (e) {
      print('Error occurred when uploading image to firebase: $e');
      imageLink = '';
      return imageLink;
    }
  }
}
