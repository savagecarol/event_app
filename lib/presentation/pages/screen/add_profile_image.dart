import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddProfileImage extends StatefulWidget {
  const AddProfileImage({super.key});

  @override
  State<AddProfileImage> createState() => _AddProfileImageState();
}

class _AddProfileImageState extends State<AddProfileImage> {
  File? imageFiles;

  Future pickImages() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.imageFiles = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
            pickImages();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Divider(),
            SizedBox(
              child: SizedBox(
                  height: 700,
                  child: imageFiles != null ? Image.file(File(imageFiles!.path), height: 60, width: 60,) : Container(),
                ),
            ),
            Divider(),
          ],
        )
        ),
    );
  }
}