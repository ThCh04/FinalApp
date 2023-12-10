import 'package:finalapp/pages/login_page.dart';
import 'package:finalapp/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const LoginView(),
      routes: getRoutes(context),
    );
  }
}
