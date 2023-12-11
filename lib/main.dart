import 'package:finalapp/pages/auth/login_page.dart';
import 'package:finalapp/routes.dart';
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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routesList,
      home: LoginView(),
    );
  }
}
