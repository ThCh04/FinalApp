import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/services/firebase/firebase_service.dart';

FirebaseFirestore _db = getDb();

Future<bool> Login(String uname, String pass) async{
  CollectionReference loginCollection = _db.collection('Users');
  QuerySnapshot querySnapshot = await loginCollection.
  where('Email', isEqualTo:uname)
      .where('Password', isEqualTo:pass).get();
  if (querySnapshot.docs.isNotEmpty){
    return true;
  }else{
    return false;
  }
}