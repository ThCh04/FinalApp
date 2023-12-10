import 'package:finalapp/pages/login_page.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getRoutes(BuildContext context){
  Map<String, WidgetBuilder> routes = {
    "/login" : (context) => const LoginView(),

  };

  return routes;
}