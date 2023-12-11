import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

FirebaseFirestore _db = FirebaseFirestore.instance;

FirebaseFirestore getDb(){
  FirebaseFirestore db = _db;
  return db;
}

Future<void> initFirebase() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}



Future<void> addExp(String title,String date, String desc, String imgRoute, String audioRoute) async{
  await _db.collection("War").add(
      {
        "title" : title,
        "desc" : desc,
        "date" : date,
        "imgRoute" : imgRoute,
        "audioRoute" : audioRoute,
      }
  );
}

Future<void> autoDelete() async{
  CollectionReference reference = _db.collection('War');
  QuerySnapshot snapshot = await reference.get();

  for(QueryDocumentSnapshot documentSnapshot in snapshot.docs){
    await documentSnapshot.reference.delete();
  }
}