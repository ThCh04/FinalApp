import 'package:finalapp/pages/login_page.dart';
import 'package:finalapp/pages/newsScreen.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/pages/mapas_multas/multas_registradas_screen.dart';
import 'package:finalapp/pages/mapas_multas/mapa_widget.dart';

Map<String, WidgetBuilder> getRoutes(BuildContext context) {
  Map<String, WidgetBuilder> routes = {
    "/login": (context) => const LoginView(),
    "/multas": (context) => MultasRegistradasScreen(),
    "/mapa": (context) => MapaMultasScreen(),
    "/news": (context) => NewsScreen(),
  };

  return routes;
}
