import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<XFile?> getImage() async{
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image;
}

Future<String?> uploadImage(File file, String folder) async {
  try {
    String nombreArchivo = basename(file.path);
    Reference referencia = FirebaseStorage.instance.ref().child(folder).child(nombreArchivo);
    await referencia.putFile(file);
    String url = await referencia.getDownloadURL();
    return url;
  } catch (e) {
    print('Error al subir el archivo: $e');
    return null;
  }
}