
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants/assets_constant.dart';
import '../../../widgets/app_circle_image.dart';

class DrawerContent extends StatefulWidget {
  const DrawerContent({super.key});

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {

  late XFile? imageFile = XFile(Assets.profilePic);

  int _selectedDestination = 0;
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      String imageFile = pickedFile.path;
    } else {
      String imageFile = Assets.profilePic;
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Header',
              ),
              FilledButton(style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder())
              ),
                onPressed: () async {
                  imageFile = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                },
                child: AppCircleImage(
                  image: imageFile!.path,
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Modifier le profil'),
          selected: _selectedDestination == 0,
          onTap: () => selectDestination(0),
        ),
        ListTile(
          leading: Icon(Icons.delete),
          title: Text('Mes Commandes'),
          selected: _selectedDestination == 1,
          onTap: () => selectDestination(1),
        ),
        ListTile(
          leading: Icon(Icons.label),
          title: Text('Mes Préférences'),
          selected: _selectedDestination == 2,
          onTap: () => selectDestination(2),
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Label',
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Log out'),
          onTap: () => FirebaseAuth.instance.signOut(),
        ),
      ],
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
