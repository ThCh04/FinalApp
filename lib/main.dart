import 'package:finalapp/pages/login_page.dart';
import 'package:finalapp/services/firebase/firebase_service.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}
