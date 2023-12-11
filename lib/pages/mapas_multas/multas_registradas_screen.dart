import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/models/multa.dart';
import 'detalles_multa_screen.dart'; // Asegúrate de tener este archivo

class MultasRegistradasScreen extends StatefulWidget {
  @override
  _MultasRegistradasScreenState createState() => _MultasRegistradasScreenState();
}

class _MultasRegistradasScreenState extends State<MultasRegistradasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multas Registradas"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Aquí es donde utilizas el stream que apunta a la colección 'fines'
        stream: FirebaseFirestore.instance.collection('Fines').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Multa multa = Multa.fromFirestore(documents[index]);

              return ListTile(
                title: Text(multa.idCard ?? 'Sin id'),
                subtitle: Text('Motivo: ${multa.desc ?? 'Sin descripcion'}\nPlaca: ${multa.plate ?? 'N/A'}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetallesMultaScreen(multa: multa),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
