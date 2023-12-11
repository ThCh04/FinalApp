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
          //ListView.builder(
          //itemCount: variable.length,
          //itemBuilder: (context, index) {
          //return ListTile(
          //title: Text(),

          //);
          //},
          //),
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
                getDriverByTitle(_controller.text)
              },
            ),
          ),
        ],
      ),
    );
  }
}
