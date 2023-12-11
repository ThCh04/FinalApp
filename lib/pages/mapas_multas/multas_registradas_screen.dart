import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finalapp/widgets/mainDrawer_widget.dart';
import 'package:finalapp/models/multa.dart';

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
                  _navigateToDetallesMulta(multa);
                },
              );
            },
          );
        },
      ),
    );
  }

  void _navigateToDetallesMulta(Multa multa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesMultaScreen(multa: multa),
      ),
    );
  }
}

class DetallesMultaScreen extends StatelessWidget {
  final Multa multa;

  const DetallesMultaScreen({required this.multa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(context),
      appBar: AppBar(
        title: Text('Detalles de Multa'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nombre: ${multa.nombre}'),
          Text('Motivo: ${multa.motivo}'),
          // Agrega más detalles según sea necesario
        ],
      ),
    );
  }
}
