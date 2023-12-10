import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

FirebaseFirestore _db = FirebaseFirestore.instance;

Future<void> initFirebase() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<List> getExperiences() async{
  List exp = [];
  CollectionReference ExperiencesCollection = _db.collection('War');
  QuerySnapshot querySnapshot = await ExperiencesCollection.get();
  querySnapshot.docs.forEach((doc) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final ex = {
      "title" : data['title'],
      "uid" : doc.id,
      "desc" : data['desc'],
      "date" : data['date'],
      "imgRoute" : data['imgRoute'],
      "audioRoute" : data['audioRoute'],

    };
    exp.add(ex);
  });
  return exp;
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