import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firebase/firebase_service.dart';

Future<DocumentSnapshot?> getDocumentByTitle(String title) async {
  QuerySnapshot querySnapshot = await getDb()
      .collection("Vehicle")
      .where("plate", isEqualTo: title)
      .limit(1)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return querySnapshot.docs.first;
  } else {
    return null;
  }
}
