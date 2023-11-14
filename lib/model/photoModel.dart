import 'package:flutter/material.dart';

class photoModel {
  late String imgsrc;
  late String photographer;

  photoModel({@required imgsrc,@required photographer});

  static fromAPI2App (Map<String, dynamic>photomap){
    return photoModel(imgsrc: (photomap["src"])["portrait"], photographer: ["photographer"]);
  }
}
