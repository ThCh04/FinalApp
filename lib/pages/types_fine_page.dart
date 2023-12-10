// types_fine_page.dart
import 'package:flutter/material.dart';
import 'package:finalapp/services/types_fine_service.dart';

class TypesFinePage extends StatelessWidget {
  final TypesFineService _typesFineService = TypesFineService();

  TypesFinePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<TypeFine> typesOfFines = _typesFineService.getTypesOfFines();

    return Scaffold(
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
