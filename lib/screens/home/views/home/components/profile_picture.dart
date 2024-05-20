import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodcourt/screens/home/views/home/components/services/storage_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  StorageService storageService = StorageService();
  Uint8List? pickedImage;


@override
  void initState() {
    super.initState();
    getProfilePicture();
  }

  Future<void> onProfileTapped() async {

    final XFile? imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile == null) return;

    await storageService.uploadImage('profile_1.jpg', imageFile);

    final imageBytes = await imageFile.readAsBytes();
    setState(() {
      pickedImage = imageBytes;
    });
  }

  Future<void> getProfilePicture() async {


        final imageBytes = await storageService.getFile('profile_1.jpg');
        if (imageBytes == null) return;
        setState(() {
          pickedImage = imageBytes;
        });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProfileTapped,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
          image: pickedImage != null
              ? DecorationImage(
                  image: Image.memory(pickedImage!,fit: BoxFit.cover).image,
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: const Center(
          child: Icon(
            Icons.person_rounded,
            color: Colors.black38,
            size: 35,
          ),
        ),
      ),
    );
  }
}
