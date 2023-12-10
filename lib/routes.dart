import 'package:finalapp/pages/login_page.dart';
import 'package:finalapp/pages/newsScreen.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getRoutes(BuildContext context){
  Map<String, WidgetBuilder> routes = {
    "/login" : (context) => const LoginView(),
<<<<<<< HEAD
    "/news" : (context) => NewsScreen(),
=======

>>>>>>> parent of a622f17 (Mapas y multas)
  };

  return routes;
}