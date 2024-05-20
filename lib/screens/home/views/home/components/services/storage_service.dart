import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {

StorageService(): ref = FirebaseStorage.instance.ref();
final Reference ref;

Future<void> uploadImage(String imageName, XFile image) async {
 try {
   final imageRef = ref.child(FirebaseAuth.instance.currentUser!.uid.toString()).child(imageName);
   final imageBytes = await image.readAsBytes();
   await imageRef.putData(imageBytes);
 } catch (e) {
   print(e);
 }

}
Future<Uint8List?> getFile(String fileName) async {
  try {
    final imageRef = ref.child(FirebaseAuth.instance.currentUser!.uid.toString()).child(fileName);
    return imageRef.getData();
  } catch (e) {
    print(e);
  }
}

Future<void> uploadFile(String filePath) async {
 // Here : lib/constants/data.dart
  File file = File(filePath);

  try {
    // Create a reference to the location you want to upload to in Firebase Storage
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref('data.dart');

    // Upload the file to Firebase Storage
    await ref.putFile(file);
  } on FirebaseException catch (e) {
    // Handle any errors
    print(e);
  }
}


  Future<void> writeFile(String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/data.txt');
    await file.writeAsString(text);
  }

}