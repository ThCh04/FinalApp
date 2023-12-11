import 'package:flutter/material.dart';
import 'package:finalapp/models/multa.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetallesMultaScreen extends StatelessWidget {
  final Multa multa;

  const DetallesMultaScreen({required this.multa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Multa'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('Fecha'),
              subtitle: Text(multa.date ?? 'No disponible'),
            ),
            ListTile(
              title: Text('Hora'),
              subtitle: Text(multa.hour ?? 'No disponible'),
            ),
            ListTile(
              title: Text('Cédula del Infractor'),
              subtitle: Text(multa.idCard ?? 'No disponible'),
            ),
            ListTile(
              title: Text('Placa del Vehículo'),
              subtitle: Text(multa.plate ?? 'No disponible'),
            ),
            ListTile(
              title: Text('Descripción'),
              subtitle: Text(multa.desc ?? 'No disponible'),
            ),
            SizedBox(height: 20),
            _buildMapSection(),
            // Agrega aquí más detalles si es necesario
          ],
        ),
      ),
    );
  }

  Widget _buildMapSection() {
    // Asegúrate de que la latitud y longitud son válidas antes de usarlas
    double? lat = double.tryParse(multa.latitud ?? '');
    double? lng = double.tryParse(multa.longitud ?? '');

    if (lat == null || lng == null) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Ubicación no disponible'),
      );
    }

    LatLng position = LatLng(lat, lng);

    return SizedBox(
      height: 300, // Altura fija para el mapa
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: position,
          zoom: 15,
        ),
        markers: {Marker(markerId: MarkerId('multaPos'), position: position)},
      ),
    );
  }
}
