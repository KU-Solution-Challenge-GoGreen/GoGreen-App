import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

final storage = FirebaseStorage.instance;

Future<String?> uploadImageToFirebase(XFile image, String path) async {
  try {
    final ref = storage.ref(path);
    final file = File(image.path);

    final snapshot = await ref.putFile(file);
    return snapshot.ref.getDownloadURL();
  } catch (e) {
    print(e);
    return null;
  }
}
