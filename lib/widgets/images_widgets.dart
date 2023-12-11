import 'dart:io';
import 'package:flutter/material.dart';

Widget imgFomrt(File? imageUpload){
  return Container(
    child: Image.file(imageUpload!, width: 200, height: 200,),
  );
}