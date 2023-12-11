import 'package:finalapp/widgets/mainDrawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/services/types_fine_service.dart';

class TypesFinePage extends StatefulWidget {
  const TypesFinePage({Key? key}) : super(key: key);

  @override
  _TypesFinePageState createState() => _TypesFinePageState();
}

class _TypesFinePageState extends State<TypesFinePage> {
  final TypesFineService _typesFineService = TypesFineService();
  late List<TypeFine> typesOfFines;

  @override
  void initState() {
    super.initState();
    _loadTypesOfFines();
  }

  void _loadTypesOfFines() {
    _typesFineService.getTypesOfFines().then((loadedTypesOfFines) {
      setState(() {
        typesOfFines = loadedTypesOfFines;
      });
    }).catchError((error) {
      print('Error loading types of fines: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(context),
      appBar: AppBar(
        title: const Text('Tarifario de multas'),
      ),
      body: typesOfFines == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: typesOfFines.length,
        itemBuilder: (context, index) {
          return TypeFineItem(typeFine: typesOfFines[index]);
        },
      ),
    );
  }
}

class TypeFineItem extends StatelessWidget {
  final TypeFine typeFine;

  TypeFineItem({required this.typeFine});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          typeFine.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87, // Cambia el color del texto del título
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              typeFine.description,
              style: TextStyle(
                color: Colors.blue,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '\$${typeFine.amount.toString()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red, // Cambia el color del texto del monto
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
