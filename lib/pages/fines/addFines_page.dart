import 'package:finalapp/services/firebase/fines/fines_service.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:finalapp/widgets/images_widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/firebase/image/image_service.dart';
import '../../widgets/mainDrawer_widget.dart';
class FinesPage extends StatefulWidget{
  const FinesPage({Key? key}) : super(key: key);

  @override
  _FinesPageState createState() => _FinesPageState();
}

class _FinesPageState extends State<FinesPage>{
  File? image_upload;
  late final XFile? image;
  TextEditingController idCardController = TextEditingController();
  TextEditingController plateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController lonController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: mainDrawer(context),
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
                      controller: idCardController,
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
                      controller: plateController,
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
                      controller: descController,
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
                    controller: latController,
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
                    controller: lonController,
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
                    controller: dateController,
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
                    controller: hourController,
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
                      onPressed: () async {
                        await submit(idCardController.text, plateController.text, image_upload,
                            descController.text, latController.text, lonController.text, dateController.text,
                            hourController.text);
                      },
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

  Future<void> submit(String? idCard, String? plate, File? evidence,String? desc, String? lat, String? lon,
      String? date, String? hour) async{
    await uploadImage(evidence!, 'evidence').then((url) => addFine(idCard!, plate!, url!, desc!, lat!, lon!, date!, hour!));
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