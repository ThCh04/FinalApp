import 'package:finalapp/widgets/mainDrawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:finalapp/models/multa.dart';

class MapaMultasScreen extends StatefulWidget {
  @override
  _MapaMultasScreenState createState() => _MapaMultasScreenState();
}

class _MapaMultasScreenState extends State<MapaMultasScreen> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(context),
      appBar: AppBar(
        title: Text("Mapa de Multas"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('multas').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          var documents = snapshot.data!.docs;
          List<Marker> markers = documents.map<Marker>((doc) {
            Multa multa = Multa.fromFirestore(doc);

            double latitud = double.tryParse(multa.latitud ?? '0') ?? 0.0;
            double longitud = double.tryParse(multa.longitud ?? '0') ?? 0.0;

            return Marker(
              markerId: MarkerId(multa.id),
              position: LatLng(latitud, longitud),
              infoWindow:
                  InfoWindow(title: multa.nombre, snippet: multa.motivo),
            );
          }).toList();

          return GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(18.7357, -70.1627), // Coordenadas aproximadas de la República Dominicana
              zoom: 7,
            ),
            markers: Set.from(markers),
          );
        },
      ),
    );
  }
}
