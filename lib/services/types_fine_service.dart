import 'package:cloud_firestore/cloud_firestore.dart';

class TypeFine {
  String name;
  String description;
  double amount;

  TypeFine({
    required this.name,
    required this.description,
    required this.amount,
  });
}

class TypesFineService {
  final CollectionReference typeFinesCollection =
  FirebaseFirestore.instance.collection('TypeFines');

  Future<List<TypeFine>> getTypesOfFines() async {
    try {
      QuerySnapshot<Object?> snapshot =
      await typeFinesCollection.get();

      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return TypeFine(
          name: data['name'] ?? '',
          description: data['description'] ?? '',
          amount: (data['amount'] ?? 0.0).toDouble(),
        );
      }).toList();
    } catch (e) {
      print('Error getting types of fines: $e');
      return [];
    }
  }
}
