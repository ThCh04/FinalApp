import 'package:flutter/material.dart';
import '../../services/inqueries_data.dart';

class LicensedriverInquiryPage extends StatelessWidget {
  const LicensedriverInquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TextEditingControllerScreen(),
    );
  }
}

class TextEditingControllerScreen extends StatefulWidget {
  const TextEditingControllerScreen({super.key});

  @override
  State<TextEditingControllerScreen> createState() =>
      _TextEditingControllerExampleState();
}

class _TextEditingControllerExampleState
    extends State<TextEditingControllerScreen> {
  final TextEditingController _controller = TextEditingController();
  String drivers_license = "";
  String owner_name = "";
  String owner_lastname = "";
  String owner_birthdate = "";
  String owner_address = "";
  String owner_phonenumbe = "";

  Future<void> _fetchData() async {
    var document = await getDocumentByTitle(_controller.text);
    if (document != null) {
      setState(() {
        drivers_license = document['drivers_license'] ?? '';
        owner_name = document['owner_name'] ?? '';
        owner_lastname = document['owner_lastname'] ?? '';
        owner_birthdate = document['owner_birthdate'] ?? '';
        owner_address = document['owner_address'] ?? '';
        owner_phonenumbe = document['owner_phonenumber'] ?? '';
      });
    } else {
      // Manejo si no se encuentra el documento
      setState(() {
        drivers_license = '';
        owner_name = '';
        owner_lastname = '';
        owner_birthdate = '';
        owner_address = '';
        owner_phonenumbe = '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toUpperCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Row(children: <Widget>[
                Text('Licencia: $drivers_license'),
                Text('Nombre: $owner_name'),
                Text('Apellido: $owner_lastname'),
                Text('Fecha de nacimiento: $owner_birthdate'),
                Text('Direccion: $owner_address'),
                Text('Tel: $owner_phonenumbe'),
              ])),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(6),
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Container(
            width: double.infinity,
            child: FloatingActionButton.small(
              child: Text("Buscar"),
              onPressed: () => {
                //Codigo para hacer fetch a la BD
                //getDriverByTitle(_controller.text)
                _fetchData()
              },
            ),
          ),
        ],
      ),
    );
  }
}
