import 'package:flutter/material.dart';

Widget mainDrawer(){
  return Drawer(
 child: Column(
   children: [
     ElevatedButton(onPressed: (){},
         child: Text('Soy un botón'))
   ],
 ),
);
}