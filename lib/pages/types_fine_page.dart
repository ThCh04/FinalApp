// types_fine_page.dart
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
    typesOfFines = _typesFineService.getTypesOfFines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(context),
      appBar: AppBar(
        title: const Text('Tipos de Multas de Tránsito'),
      ),
      body: ListView.builder(
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
    return ListTile(
      title: Text(typeFine.name),
      subtitle: Text(typeFine.description),
      trailing: Text('\$${typeFine.amount.toString()}'),
    );
  }
}
