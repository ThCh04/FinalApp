// types_fine_service.dart

class TypeFine {
  String name;
  String description;
  double amount;

  TypeFine({required this.name, required this.description, required this.amount});
}

class TypesFineService {
  List<TypeFine> getTypesOfFines() {
    // Simulamos un servicio que obtiene los tipos de multas desde una fuente externa, como una API
    return [
      TypeFine(name: 'Exceso de velocidad', description: 'Conducir a una velocidad superior al límite establecido.', amount: 100.0),
      TypeFine(name: 'Estacionamiento prohibido', description: 'Estacionar en áreas no permitidas.', amount: 50.0),
      // Agrega más tipos de multas según sea necesario
    ];
  }
}
