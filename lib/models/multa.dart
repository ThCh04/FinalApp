import 'package:cloud_firestore/cloud_firestore.dart';

class Multa {
  String id;
  String? nombre; // Puede ser null
  String? motivo; // Puede ser null
  String? latitud; // Puede ser null
  String? longitud; // Puede ser null
  // Otros campos según necesites

  Multa(
      {required this.id,
      this.nombre,
      this.motivo,
      this.latitud,
      this.longitud});

  factory Multa.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Multa(
      id: doc.id,
      nombre: data['nombre'],
      motivo: data['motivo'],
      latitud: data['latitud'],
      longitud: data['longitud'],
      // Inicializa otros campos
    );
  }
}
