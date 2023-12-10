import 'package:finalapp/pages/login_page.dart';
import 'package:finalapp/pages/newsScreen.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getRoutes(BuildContext context){
  Map<String, WidgetBuilder> routes = {
    "/login" : (context) => const LoginView(),
    "/news" : (context) => NewsScreen(),
  };

  return routes;
}