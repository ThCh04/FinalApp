import 'package:flutter/material.dart';
import '../../services/inqueries_data.dart';

class CarPlateInquiryPage extends StatelessWidget {
  const CarPlateInquiryPage({super.key});

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
  String plate = "";
  String model = "";
  String brand = "";
  String year = "";
  String color = "";

  Future<void> _fetchData() async {
    var document = await getDocumentByTitle(_controller.text);
    if (document != null) {
      setState(() {
        plate = document['plate'] ?? '';
        model = document['model'] ?? '';
        brand = document['brand'] ?? '';
        year = document['year'] ?? '';
        color = document['color'] ?? '';
      });
    } else {
      // Manejo si no se encuentra el documento
      setState(() {
        plate = '';
        model = '';
        brand = '';
        year = '';
        color = '';
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
              Text('Placa: $plate'),
              Text('Modelo: $model'),
              Text('Marca: $brand'),
              Text('Año: $year'),
              Text('Color: $color'),
            ]),
          ),
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
                //getDocumentByTitle(_controller.text),
                _fetchData()
              },
            ),
          ),
        ],
      ),
    );
  }
}
