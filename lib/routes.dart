import 'package:finalapp/pages/auth/login_page.dart';
import 'package:finalapp/pages/fines/addFines_page.dart';
import 'package:finalapp/pages/inqueries/carPlateInquiry.dart';
import 'package:finalapp/pages/inqueries/licensedriverInquiry.dart';
import 'package:finalapp/pages/newsScreen.dart';
import 'package:finalapp/pages/types_fine_page.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/pages/mapas_multas/multas_registradas_screen.dart';
import 'package:finalapp/pages/mapas_multas/mapa_widget.dart';
import 'package:path/path.dart';


Map<String, WidgetBuilder> routesList = {
    "/login": (context) =>  const LoginView(),
    "/multas": (context) => MultasRegistradasScreen(),
    "/mapa": (context) => MapaMultasScreen(),
    "/news": (context) => NewsScreen(),
    "/fines": (context) => const FinesPage(),
  "/typesfine": (context) => const TypesFinePage(),
  "/plate" : (context) => const CarPlateInquiryPage(),
  "/license" : (context) => const LicensedriverInquiryPage(),
  };

