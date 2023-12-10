import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finalapp/models/multa.dart';

class MultasRegistradasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multas Registradas"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('multas').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          // Ahora snapshot.data ya no es null aquí, pero aún debemos manejar la lista de documentos.
          var documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Multa multa = Multa.fromFirestore(documents[index]);

              return ListTile(
                title: Text(multa.nombre ?? 'Sin nombre'),
                subtitle: Text(multa.motivo ?? 'Sin motivo'),
                onTap: () {
                  // Navega a la pantalla de detalles de la multa
                },
              );
            },
          );
        },
      ),
    );
  }
}
