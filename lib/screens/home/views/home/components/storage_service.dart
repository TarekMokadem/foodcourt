import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {

StorageService(): ref = FirebaseStorage.instance.ref();
final Reference ref;

Future<void> uploadFile(String fileName, XFile file) async {
 try {
   final imageRef = ref.child(FirebaseAuth.instance.currentUser!.uid.toString()).child(fileName);
   final imageBytes = await file.readAsBytes();
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
  }