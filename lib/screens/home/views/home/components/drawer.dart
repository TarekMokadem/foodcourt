import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodcourt/screens/home/views/home/components/profile_picture.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/assets_constant.dart';
import '../../../../../constants/data.dart';
import '../../../widgets/app_circle_image.dart';

class DrawerContent extends StatefulWidget {
  const DrawerContent({super.key});

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {

  late XFile? imageFile = XFile(Assets.profilePic);
  late List<int>? pickedImage;

  Future<void> onProfileTapped() async {
    final XFile? imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile == null) return;
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child('profile').child('profile.jpg');
    final imageBytes = await imageFile.readAsBytes();
    await imageRef.putData(imageBytes);
    setState(() {
      pickedImage = imageBytes;
    });
  }

  int _selectedDestination = 0;


  @override
  Widget build(BuildContext context) {

    String userEmail = FirebaseAuth.instance.currentUser!.email.toString();
    return Consumer<Menu>(
      builder: (context,menu,child) {
        return ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    userEmail,
                  ),
                  ProfilePicture(),
                ],
              ),
            ),
            const Divider(
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
              onTap: () {
                menu.clearCart();
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        );
      }
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
