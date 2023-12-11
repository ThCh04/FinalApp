import 'package:cloud_firestore/cloud_firestore.dart';

class Multa {
  String id;
  String? latitud;
  String? longitud;
  String? date;
  String? desc;
  String? evidence;
  String? hour;
  String? idCard;
  String? plate;

  Multa({
    required this.id,
    this.latitud,
    this.longitud,
    this.date,
    this.desc,
    this.evidence,
    this.hour,
    this.idCard,
    this.plate,
  });

  factory Multa.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Multa(
      id: doc.id,
      latitud: data['lat'],
      longitud: data['lon'],
      date: data['date'],
      desc: data['desc'],
      evidence: data['evidence'],
      hour: data['hour'],
      idCard: data['idCard'],
      plate: data['plate'],
    );
  }
}
