import 'package:cloud_firestore/cloud_firestore.dart';
import '../firebase_service.dart';

FirebaseFirestore _db = getDb();

Future<void> addFine(String idCard,String plate,
    String imgURL, String desc,String lat,
    String lon, String date,String hour) async{
  await _db.collection("Fines").add(
      {
        "idCard" : idCard,
        "plate" : plate,
        "evidence" : imgURL,
        "desc" : desc,
        "lat" : lat,
        "lon" : lon,
        "date": date,
        "hour" : hour,
      }
  );
}