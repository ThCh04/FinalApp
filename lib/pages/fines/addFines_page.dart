import 'package:flutter/material.dart';
import 'dart:io';
import 'package:finalapp/widgets/images_widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/firebase/image/image_service.dart';
class FinesPage extends StatefulWidget{
  const FinesPage({Key? key}) : super(key: key);

  @override
  _FinesPageState createState() => _FinesPageState();
}

class _FinesPageState extends State<FinesPage>{
  File? image_upload;
  late final XFile? image;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicar Multa'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image_upload != null ? imgFomrt(image_upload): Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              color: Colors.grey[300],
              child:const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ninguna imagen seleccionada')
                ],
              ) ,

            ),
              _imgBtn(),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.925,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: null,
                      decoration:  InputDecoration(
                        hintText: '000-0000000-0', labelText: 'Cedula',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: null,
                      decoration:  InputDecoration(
                        hintText: '000-0000000-0', labelText: 'Placa del vehículo',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    DropdownButton<String>(
                      isExpanded: true,
                      items: null,
                      onChanged: (_){},
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextFormField(
                      controller: null,
                      maxLines: 3,
                      decoration:  InputDecoration(
                        hintText: 'Escribe un comentario', labelText: 'Comentario',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.45,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: null,
                    decoration:  InputDecoration(
                      hintText: '18.7', labelText: 'Latitud',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.45,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: null,
                    decoration:  InputDecoration(
                      hintText: '-69.6', labelText: 'Longitud',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.45,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: null,
                    decoration:  InputDecoration(
                      hintText: '01/12/2023', labelText: 'Fecha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.45,
                  child:   TextFormField(
                    keyboardType: TextInputType.number,
                    controller: null,
                    decoration:  InputDecoration(
                      hintText: '18:40', labelText: 'Hora',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.925,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text('Multar'),

                    ),
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
  SizedBox _imgBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.3,
      child: ElevatedButton(
        onPressed: () async{
          image = await getImage();
          setState(() {
            image_upload = File(image!.path);
          });

        },
        child: const Text('Subir Imagen'),
      ),
    );
  }
}