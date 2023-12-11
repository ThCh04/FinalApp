import 'package:flutter/material.dart';

Widget mainDrawer(BuildContext context){
  return Drawer(
 child: Column(
   children: [
    SingleChildScrollView(
         child:
           Column(
             children: [
               const Padding(padding:  EdgeInsets.only(top: 100)),
               TextButton(
                   onPressed: (){
                     Navigator.of(context).pushReplacementNamed('/fines');
                   },
                   child: const  Text('Aplicar Multa')
               ),
           TextButton(
               onPressed: (){
                 Navigator.of(context).pushReplacementNamed('/license');
               },
               child: const  Text('Consultar Conductor')
           ),
           TextButton(
               onPressed: (){
                 Navigator.of(context).pushReplacementNamed('/plate');
               },
               child: const  Text('Consultar Vehículo')
           ),
           TextButton(
               onPressed: (){},
               child: const  Text('Estado del Clima')
           ),
           TextButton(
               onPressed: (){},
               child: const  Text('Horóscopo')
           ),
           TextButton(
               onPressed: (){
                 Navigator.of(context).pushReplacementNamed('/mapa');
               },
               child: const  Text('Mapa de Multas')
           ),
           TextButton(
               onPressed: (){
                 Navigator.of(context).pushReplacementNamed('/fineHistory');
               },
               child: const  Text('Multas Registradas')
           ),
           TextButton(
               onPressed: (){
                 Navigator.of(context).pushReplacementNamed('/news');
               },
               child: const  Text('Noticias')
           ),
           TextButton(
               onPressed: (){
                 Navigator.of(context).pushReplacementNamed('/typesfine');
               },
               child: const  Text('Tarifario de Multas')
           ),
       ]),
           )
   ],
 ),
);
}